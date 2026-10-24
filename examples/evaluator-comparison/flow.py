"""Mini flow: one worker agent, two kinds of judge agents, and a comparison.

1. A worker deep agent summarizes support tickets (the "simple task").
2. Judge A reads `judges/rubric.md` (prose instructions) and gives a holistic score.
3. Judge B reads `judges/formula.md` (a math scoring function), must measure the
   variables N, C, H, W and compute the score itself. `formula+calc` is the same
   judge with a calculator tool.
4. Every judge scores synthetic summaries whose true quality is known
   (see `dataset.py`); the judge closest to the gold scores, and most stable
   across repeats, wins.

Usage:
    uv run python flow.py                     # real run, needs ANTHROPIC_API_KEY
    uv run python flow.py --model fake        # offline smoke test of the plumbing
"""

from __future__ import annotations

import argparse
import ast
import json
import operator
import random
import re
import statistics
import time
from collections.abc import Callable, Sequence
from dataclasses import dataclass, field
from itertools import combinations
from pathlib import Path
from typing import Any

from deepagents import create_deep_agent
from deepagents.backends.utils import create_file_data
from langchain_core.language_models.chat_models import BaseChatModel
from langchain_core.messages import AIMessage, BaseMessage, HumanMessage, ToolMessage
from langchain_core.outputs import ChatGeneration, ChatResult
from langchain_core.tools import tool

from dataset import TICKETS, Candidate, build_candidates, gold_score, word_count

HERE = Path(__file__).parent
DEFAULT_MODEL = "anthropic:claude-sonnet-5-5"

WORKER_PROMPT = (
    "Bạn là nhân viên chăm sóc khách hàng. Tóm tắt ticket được giao thành tối đa 60 từ, "
    "nêu đủ các ý quan trọng, không thêm thông tin không có trong ticket. "
    "Chỉ trả về bản tóm tắt."
)

JUDGE_PROMPT = (
    "Bạn là giám khảo chấm bản tóm tắt ticket. Trước khi chấm, BẮT BUỘC dùng read_file đọc "
    "{path} và làm đúng theo hướng dẫn trong đó. Kết thúc bằng đúng một khối JSON."
)


# ---------------------------------------------------------------------------
# Calculator tool for the formula judge
# ---------------------------------------------------------------------------

_OPS: dict[type, Callable[..., float]] = {
    ast.Add: operator.add,
    ast.Sub: operator.sub,
    ast.Mult: operator.mul,
    ast.Div: operator.truediv,
    ast.Pow: operator.pow,
    ast.USub: operator.neg,
}
_FUNCS: dict[str, Callable[..., float]] = {"max": max, "min": min, "round": round}


def _eval(node: ast.AST) -> float:
    if isinstance(node, ast.Constant) and isinstance(node.value, int | float):
        return node.value
    if isinstance(node, ast.BinOp) and type(node.op) in _OPS:
        return _OPS[type(node.op)](_eval(node.left), _eval(node.right))
    if isinstance(node, ast.UnaryOp) and type(node.op) in _OPS:
        return _OPS[type(node.op)](_eval(node.operand))
    if isinstance(node, ast.Call) and isinstance(node.func, ast.Name) and node.func.id in _FUNCS:
        return _FUNCS[node.func.id](*[_eval(a) for a in node.args])
    msg = f"unsupported expression: {ast.dump(node)}"
    raise ValueError(msg)


@tool
def calculator(expression: str) -> str:
    """Evaluate an arithmetic expression, e.g. `10 * (3/4) * max(0, 1 - 0.5*1)`.

    Supports + - * / ** and max, min, round.
    """
    try:
        return str(_eval(ast.parse(expression, mode="eval").body))
    except (ValueError, SyntaxError, ZeroDivisionError) as e:
        return f"error: {e}"


# ---------------------------------------------------------------------------
# Offline fake model (plumbing smoke test only, its scores mean nothing)
# ---------------------------------------------------------------------------


class FakeModel(BaseChatModel):
    """Scripted stand-in for an LLM so the flow runs without an API key.

    Workers echo the ticket's first sentences. Judges call `read_file` once, then
    answer with a noisy heuristic built from word overlap.
    """

    seed: int = 0

    @property
    def _llm_type(self) -> str:
        return "fake-evaluator"

    def bind_tools(self, tools: Sequence[Any], **kwargs: Any) -> FakeModel:  # tools are scripted
        return self

    def _generate(self, messages: list[BaseMessage], stop: list[str] | None = None, **kwargs: Any) -> ChatResult:
        prompt = next(m.content for m in messages if isinstance(m, HumanMessage))
        rng = random.Random(f"{self.seed}:{prompt}")
        if "BẢN TÓM TẮT" not in prompt:
            text = prompt.split("TICKET:", 1)[-1].strip()
            return _result(AIMessage(content=" ".join(text.split()[:50])))
        path = "/formula.md" if "/formula.md" in str(messages[0].content) else "/rubric.md"
        if not any(isinstance(m, ToolMessage) for m in messages):
            call = {"name": "read_file", "args": {"file_path": path}, "id": "call_read", "type": "tool_call"}
            return _result(AIMessage(content="", tool_calls=[call]))
        points = re.findall(r"^\d+\. (.+)$", prompt, re.MULTILINE)
        summary = prompt.split("BẢN TÓM TẮT:", 1)[1].strip()
        words = set(summary.lower().split())
        c = sum(len(words & set(p.lower().split())) >= 2 for p in points)
        h = rng.choice([0, 0, 0, 1])
        w = word_count(summary) + rng.randint(-3, 3)
        if path == "/formula.md":
            payload = {"N": len(points), "C": c, "H": h, "W": w, "score": gold_score(len(points), c, h, w)}
        else:
            payload = {"reason": "fake", "score": round(10 * c / max(len(points), 1) - 3 * h + rng.uniform(-1.5, 1.5), 1)}
        return _result(AIMessage(content=f"```json\n{json.dumps(payload)}\n```"))


def _result(message: AIMessage) -> ChatResult:
    return ChatResult(generations=[ChatGeneration(message=message)])


# ---------------------------------------------------------------------------
# Agents
# ---------------------------------------------------------------------------


@dataclass
class Judgement:
    score: float | None
    raw: dict[str, Any]
    seconds: float
    tokens: int
    tool_calls: list[str]
    error: str | None = None


@dataclass
class JudgeSpec:
    name: str
    file: str
    tools: list[Any] = field(default_factory=list)


JUDGES = [
    JudgeSpec("rubric", "rubric.md"),
    JudgeSpec("formula", "formula.md"),
    JudgeSpec("formula+calc", "formula.md", [calculator]),
]


def make_model(name: str, seed: int) -> BaseChatModel | str:
    return FakeModel(seed=seed) if name == "fake" else name


def judge_input(ticket_text: str, key_points: list[str], summary: str) -> str:
    points = "\n".join(f"{i}. {p}" for i, p in enumerate(key_points, 1))
    return f"TICKET GỐC:\n{ticket_text}\n\nÝ CHÍNH BẮT BUỘC:\n{points}\n\nBẢN TÓM TẮT:\n{summary}"


def extract_json(text: str) -> dict[str, Any]:
    blocks = re.findall(r"\{[^{}]*\}", text, re.DOTALL)
    if not blocks:
        msg = "no JSON object in judge answer"
        raise ValueError(msg)
    return json.loads(blocks[-1])


def _text(message: BaseMessage) -> str:
    if isinstance(message.content, str):
        return message.content
    return "".join(part.get("text", "") for part in message.content if isinstance(part, dict))


def run_agent(agent: Any, prompt: str, files: dict[str, str] | None = None) -> tuple[str, list[BaseMessage], float]:
    start = time.perf_counter()
    state: dict[str, Any] = {"messages": [HumanMessage(content=prompt)]}
    if files:
        state["files"] = {path: create_file_data(content) for path, content in files.items()}
    result = agent.invoke(state)
    return _text(result["messages"][-1]), result["messages"], time.perf_counter() - start


def judge(spec: JudgeSpec, model: BaseChatModel | str, candidate_input: str) -> Judgement:
    path = f"/{spec.file}"
    agent = create_deep_agent(model=model, tools=spec.tools, system_prompt=JUDGE_PROMPT.format(path=path))
    try:
        answer, messages, seconds = run_agent(agent, candidate_input, {path: (HERE / "judges" / spec.file).read_text()})
    except Exception as e:  # noqa: BLE001  # one failed judgement must not kill the whole experiment
        return Judgement(None, {}, 0.0, 0, [], error=repr(e))
    tokens = sum((getattr(m, "usage_metadata", None) or {}).get("total_tokens", 0) for m in messages)
    calls = [c["name"] for m in messages if isinstance(m, AIMessage) for c in m.tool_calls]
    try:
        raw = extract_json(answer)
        score = float(raw["score"])
    except (ValueError, KeyError, TypeError) as e:
        return Judgement(None, {}, seconds, tokens, calls, error=f"parse: {e}")
    return Judgement(score, raw, seconds, tokens, calls)


# ---------------------------------------------------------------------------
# Metrics
# ---------------------------------------------------------------------------


def _ranks(xs: list[float]) -> list[float]:
    order = sorted(range(len(xs)), key=xs.__getitem__)
    ranks = [0.0] * len(xs)
    i = 0
    while i < len(order):
        j = i
        while j + 1 < len(order) and xs[order[j + 1]] == xs[order[i]]:
            j += 1
        for k in range(i, j + 1):
            ranks[order[k]] = (i + j) / 2
        i = j + 1
    return ranks


def spearman(xs: list[float], ys: list[float]) -> float:
    if len(xs) < 2:
        return float("nan")
    rx, ry = _ranks(xs), _ranks(ys)
    try:
        return statistics.correlation(rx, ry)
    except statistics.StatisticsError:
        return float("nan")


def pairwise_accuracy(golds: list[float], preds: list[float], groups: list[str]) -> float:
    """Share of same-ticket pairs (gold gap >= 1) that the judge orders correctly."""
    hits = total = 0
    for i, j in combinations(range(len(golds)), 2):
        if groups[i] != groups[j] or abs(golds[i] - golds[j]) < 1:
            continue
        total += 1
        hits += (golds[i] - golds[j]) * (preds[i] - preds[j]) > 0
    return hits / total if total else float("nan")


def summarize(candidates: list[Candidate], results: dict[str, list[list[Judgement]]]) -> dict[str, dict[str, Any]]:
    report: dict[str, dict[str, Any]] = {}
    for name, per_candidate in results.items():
        golds, preds, groups, stds = [], [], [], []
        arith_err = var_hits = var_total = failures = 0
        tokens = seconds = 0.0
        runs = 0
        for cand, judgements in zip(candidates, per_candidate, strict=True):
            ok = [j for j in judgements if j.score is not None]
            failures += len(judgements) - len(ok)
            runs += len(judgements)
            tokens += sum(j.tokens for j in judgements)
            seconds += sum(j.seconds for j in judgements)
            if not ok:
                continue
            scores = [j.score for j in ok]
            golds.append(cand.gold)
            preds.append(statistics.mean(scores))
            groups.append(cand.ticket.id)
            if len(scores) > 1:
                stds.append(statistics.stdev(scores))
            for j in ok:
                if not {"N", "C", "H", "W"} <= j.raw.keys():
                    continue
                try:
                    recomputed = gold_score(*(int(j.raw[k]) for k in ("N", "C", "H", "W")))
                except (ValueError, TypeError, ZeroDivisionError):
                    arith_err += 1
                    continue
                arith_err += abs(recomputed - j.score) > 0.05
                var_total += 1
                var_hits += int(j.raw["C"]) == cand.truth["C"] and int(j.raw["H"]) == cand.truth["H"]
        report[name] = {
            "spearman": spearman(golds, preds),
            "mae": statistics.mean(abs(g - p) for g, p in zip(golds, preds, strict=True)) if golds else float("nan"),
            "pairwise_acc": pairwise_accuracy(golds, preds, groups),
            "stdev_repeat": statistics.mean(stds) if stds else float("nan"),
            "fail_rate": failures / runs if runs else float("nan"),
            "arith_err_rate": arith_err / var_total if var_total else None,
            "var_acc": var_hits / var_total if var_total else None,
            "tokens_per_run": tokens / runs if runs else 0,
            "sec_per_run": seconds / runs if runs else 0,
        }
    return report


# ---------------------------------------------------------------------------
# Report
# ---------------------------------------------------------------------------


def _fmt(v: Any, pct: bool = False) -> str:
    if v is None:
        return "—"
    if isinstance(v, float) and v != v:  # noqa: PLR0124  # NaN check
        return "n/a"
    return f"{v:.0%}" if pct else f"{v:.2f}"


def render_report(
    model: str,
    repeats: int,
    candidates: list[Candidate],
    results: dict[str, list[list[Judgement]]],
    metrics: dict[str, dict[str, Any]],
    worker_rows: list[tuple[str, str, dict[str, float | None]]],
) -> str:
    lines = [
        "# Kết quả so sánh bộ đánh giá",
        "",
        f"- Model: `{model}`, {len(candidates)} bản tóm tắt có điểm chuẩn, lặp {repeats} lần mỗi giám khảo.",
    ]
    if model == "fake":
        lines.append("- **Chạy offline với FakeModel: chỉ kiểm tra luồng chạy, các con số không có ý nghĩa.**")
    lines += [
        "",
        "| Giám khảo | Spearman ↑ | MAE ↓ | Xếp cặp đúng ↑ | Lệch khi lặp ↓ | Lỗi parse ↓ | Đếm biến đúng (C,H) ↑ | Tính sai ↓ | Token/lần | Giây/lần |",
        "|---|---|---|---|---|---|---|---|---|---|",
    ]
    for name, m in metrics.items():
        lines.append(
            f"| {name} | {_fmt(m['spearman'])} | {_fmt(m['mae'])} | {_fmt(m['pairwise_acc'], pct=True)} "
            f"| {_fmt(m['stdev_repeat'])} | {_fmt(m['fail_rate'], pct=True)} | {_fmt(m['var_acc'], pct=True)} "
            f"| {_fmt(m['arith_err_rate'], pct=True)} | {m['tokens_per_run']:.0f} | {m['sec_per_run']:.1f} |"
        )
    best = max(metrics, key=lambda n: (_nan0(metrics[n]["spearman"]), -_nan0(metrics[n]["mae"])))
    lines += ["", f"**Tốt nhất theo Spearman (hoà thì xét MAE): `{best}`**", ""]
    lines += [
        "## Chi tiết từng bản tóm tắt",
        "",
        "| Bản tóm tắt | Thật (C,H,W) | Gold | " + " | ".join(results) + " |",
        "|---|---|---|" + "---|" * len(results),
    ]
    for i, cand in enumerate(candidates):
        cells = []
        for per_candidate in results.values():
            scores = [j.score for j in per_candidate[i] if j.score is not None]
            cells.append("/".join(f"{s:g}" for s in scores) or "lỗi")
        t = cand.truth
        lines.append(f"| {cand.id} | {t['C']},{t['H']},{t['W']} | {cand.gold:g} | " + " | ".join(cells) + " |")
    if worker_rows:
        lines += ["", "## Bản tóm tắt do worker agent viết (không có gold)", ""]
        for ticket_id, summary, scores in worker_rows:
            score_txt = ", ".join(f"{k}: {_fmt(v)}" for k, v in scores.items())
            lines += [f"- **{ticket_id}** ({score_txt}): {summary}"]
    return "\n".join(lines) + "\n"


def _nan0(v: float) -> float:
    return -1e9 if v != v else v  # noqa: PLR0124  # NaN sorts last


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--model", default=DEFAULT_MODEL, help="provider:model, or 'fake' for an offline run")
    parser.add_argument("--repeats", type=int, default=2, help="times each judge scores each summary")
    parser.add_argument("--limit", type=int, default=None, help="only use the first N synthetic summaries")
    parser.add_argument("--judges", default=",".join(j.name for j in JUDGES))
    parser.add_argument("--out", default=str(HERE / "results"))
    args = parser.parse_args()

    candidates = build_candidates()[: args.limit]
    specs = [j for j in JUDGES if j.name in args.judges.split(",")]
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)

    # 1. Worker agent does the simple task.
    worker = create_deep_agent(model=make_model(args.model, 0), system_prompt=WORKER_PROMPT)
    worker_summaries = []
    for ticket in TICKETS:
        summary, _, _ = run_agent(worker, f"TICKET:\n{ticket.text}")
        worker_summaries.append((ticket, summary.strip()))
        print(f"[worker] {ticket.id}: {summary.strip()[:80]}...")

    # 2. Every judge scores every synthetic summary `repeats` times.
    results: dict[str, list[list[Judgement]]] = {s.name: [] for s in specs}
    for spec in specs:
        for cand in candidates:
            prompt = judge_input(cand.ticket.text, cand.ticket.key_points, cand.summary)
            runs = [judge(spec, make_model(args.model, r), prompt) for r in range(args.repeats)]
            results[spec.name].append(runs)
            shown = [j.score if j.error is None else "ERR" for j in runs]
            print(f"[{spec.name}] {cand.id}: gold={cand.gold} -> {shown}")

    # 3. Judges also score the real worker output (no gold, just to show usage).
    worker_rows = []
    for ticket, summary in worker_summaries:
        prompt = judge_input(ticket.text, ticket.key_points, summary)
        worker_rows.append((ticket.id, summary, {s.name: judge(s, make_model(args.model, 0), prompt).score for s in specs}))

    metrics = summarize(candidates, results)
    report = render_report(args.model, args.repeats, candidates, results, metrics, worker_rows)
    (out / "report.md").write_text(report)
    raw = {
        name: [{"id": c.id, "gold": c.gold, "truth": c.truth, "runs": [j.__dict__ for j in runs]} for c, runs in zip(candidates, per, strict=True)]
        for name, per in results.items()
    }
    (out / "raw.json").write_text(json.dumps({"metrics": metrics, "results": raw}, ensure_ascii=False, indent=2))
    print("\n" + report.split("## Chi tiết")[0])
    print(f"Saved {out / 'report.md'} and {out / 'raw.json'}")


if __name__ == "__main__":
    main()
