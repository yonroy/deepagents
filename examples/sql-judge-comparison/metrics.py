"""Score judges against execution-based gold labels and render the report."""

from __future__ import annotations

import math
import random
import statistics
from collections import Counter, defaultdict
from itertools import combinations
from pathlib import Path
from typing import Any

from mutate import load_questions

PENALTY = {"invalid": 1.0, "fan_out": 0.6, "join_type": 0.5, "distinct": 0.4, "null": 0.4}
Judgements = dict[tuple[str, str, int], dict[str, dict[str, Any]]]


def says_correct(answer: dict[str, Any] | None) -> bool | None:
    if not answer or answer.get("verdict") not in ("correct", "incorrect"):
        return None
    return answer["verdict"] == "correct"


def auroc(scores: list[float], labels: list[bool]) -> float:
    pos = [s for s, y in zip(scores, labels, strict=True) if y]
    neg = [s for s, y in zip(scores, labels, strict=True) if not y]
    if not pos or not neg:
        return float("nan")
    wins = sum(1.0 if p > n else 0.5 if p == n else 0.0 for p in pos for n in neg)
    return wins / (len(pos) * len(neg))


def mcnemar_p(b: int, c: int) -> float:
    """Exact two-sided McNemar test on the discordant pairs b and c."""
    n = b + c
    if n == 0:
        return 1.0
    tail = sum(math.comb(n, k) for k in range(min(b, c) + 1)) / 2**n
    return min(1.0, 2 * tail)


def bootstrap_ci(hits: dict[str, list[bool]], n_boot: int = 2000, seed: int = 0) -> tuple[float, float]:
    """95% CI of accuracy, resampling candidates (each carries all its repeats)."""
    keys = list(hits)
    rng = random.Random(seed)
    stats = []
    for _ in range(n_boot):
        sample = [h for k in rng.choices(keys, k=len(keys)) for h in hits[k]]
        stats.append(sum(sample) / len(sample))
    stats.sort()
    return stats[int(0.025 * n_boot)], stats[int(0.975 * n_boot)]


def formula_checks(answer: dict[str, Any]) -> tuple[bool, bool]:
    """(arithmetic error, verdict breaks the stated rule) for one formula answer."""
    reqs = answer.get("requirements") or []
    try:
        coverage = sum(float(r["s"]) for r in reqs) / len(reqs)
        penalty = math.prod(1 - PENALTY.get(e, 0.0) for e in answer.get("errors") or [])
        expected = round(10 * coverage * penalty, 2)
        arith_err = abs(expected - float(answer["score"])) > 0.05
    except (KeyError, TypeError, ValueError, ZeroDivisionError):
        return True, True
    rule_ok = float(answer["score"]) >= 8 and "invalid" not in (answer.get("errors") or [])
    return arith_err, rule_ok != (answer.get("verdict") == "correct")


def requirement_recall(answer: dict[str, Any], gold_reqs: list[dict[str, str]]) -> float:
    """Approximate: per-type overlap of requirement counts with the gold requirement list."""
    got = Counter(r.get("type") for r in answer.get("requirements") or [])
    want = Counter(r["type"] for r in gold_reqs)
    return sum(min(got[t], n) for t, n in want.items()) / sum(want.values())


def _pct(v: float) -> str:
    return "n/a" if v != v else f"{v:.0%}"  # noqa: PLR0124  # NaN check


def summarize(candidates: list[dict[str, Any]], judgements: Judgements) -> dict[tuple[str, str], dict[str, Any]]:
    gold_reqs = {q["id"]: q["requirements"] for q in load_questions()}
    by_id = {c["id"]: c for c in candidates}
    grouped: dict[tuple[str, str], dict[int, dict[str, dict[str, Any]]]] = defaultdict(dict)
    for (judge, model, rep), answers in judgements.items():
        grouped[(judge, model)][rep] = answers

    out: dict[tuple[str, str], dict[str, Any]] = {}
    for key, reps in sorted(grouped.items()):
        hits: dict[str, list[bool]] = defaultdict(list)
        verdicts: dict[str, list[bool]] = defaultdict(list)
        scores: dict[str, list[float]] = defaultdict(list)
        missing = arith = rule = 0
        req_recall: list[float] = []
        for answers in reps.values():
            for cid, c in by_id.items():
                a = answers.get(cid)
                v = says_correct(a)
                if v is None:
                    missing += 1
                    continue
                verdicts[cid].append(v)
                hits[cid].append(v == c["gold_correct"])
                try:
                    scores[cid].append(float(a["score"]))
                except (KeyError, TypeError, ValueError):
                    pass
                if key[0] == "formula":
                    e1, e2 = formula_checks(a)
                    arith += e1
                    rule += e2
                    req_recall.append(requirement_recall(a, gold_reqs[c["qid"]]))
        n_runs = sum(len(v) for v in verdicts.values())

        def rate(pred: Any, cands: list[dict[str, Any]], verdicts: dict[str, list[bool]] = verdicts) -> float:
            vals = [pred(v) for c in cands for v in verdicts.get(c["id"], [])]
            return sum(vals) / len(vals) if vals else float("nan")

        wrong = [c for c in candidates if not c["gold_correct"]]
        right = [c for c in candidates if c["gold_correct"]]
        with_score = [cid for cid in scores if scores[cid]]
        multi = [v for v in verdicts.values() if len(v) > 1]
        groups: dict[str, dict[str, float]] = {}
        for label, keyfn in [
            ("source", lambda c: c["source"]),
            ("level", lambda c: c["level"]),
            ("op", lambda c: (c["op"] or "").replace("trap:", "")),
        ]:
            buckets: dict[str, list[dict[str, Any]]] = defaultdict(list)
            for c in candidates:
                if label != "op" or c["op"]:
                    buckets[keyfn(c)].append(c)
            groups[label] = {
                k: rate(lambda v: True, [])
                if not cs
                else sum(h for c in cs for h in hits.get(c["id"], [])) / max(1, sum(len(hits.get(c["id"], [])) for c in cs))
                for k, cs in sorted(buckets.items())
            }
        all_hits = [h for hs in hits.values() for h in hs]
        out[key] = {
            "runs": n_runs,
            "missing": missing,
            "accuracy": sum(all_hits) / len(all_hits) if all_hits else float("nan"),
            "ci": bootstrap_ci(hits) if hits else (float("nan"), float("nan")),
            "bug_recall": rate(lambda v: not v, wrong),
            "false_alarm": rate(lambda v: not v, right),
            "auroc": auroc([statistics.mean(scores[c]) for c in with_score], [by_id[c]["gold_correct"] for c in with_score]),
            "trap_fooled": rate(lambda v: v, [c for c in candidates if c["source"] == "T"]),
            "flip_rate": sum(len(set(v)) > 1 for v in multi) / len(multi) if multi else float("nan"),
            "arith_err": arith / n_runs if key[0] == "formula" and n_runs else float("nan"),
            "rule_break": rule / n_runs if key[0] == "formula" and n_runs else float("nan"),
            "req_recall": statistics.mean(req_recall) if req_recall else float("nan"),
            "groups": groups,
            "rep0": {cid: says_correct(a) for cid, a in reps.get(0, {}).items()},
        }
    return out


def write_report(candidates: list[dict[str, Any]], judgements: Judgements, path: Path) -> None:
    m = summarize(candidates, judgements)
    n_ok = sum(c["gold_correct"] for c in candidates)
    lines = [
        "# Kết quả: rubric vs công thức trên Text-to-SQL",
        "",
        f"{len(candidates)} câu SQL, {n_ok} đúng / {len(candidates) - n_ok} sai theo kết quả chạy thật.",
        "",
        "## Tổng hợp",
        "",
        "| Giám khảo | Model | Lượt | Accuracy (CI 95%) ↑ | Bắt lỗi ↑ | Chê oan ↓ | AUROC ↑ | Bị bẫy ↓ | Đổi ý khi chấm lại ↓ | Thiếu đáp án |",
        "|---|---|---|---|---|---|---|---|---|---|",
    ]
    for (judge, model), s in m.items():
        lo, hi = s["ci"]
        lines.append(
            f"| {judge} | {model} | {s['runs']} | {_pct(s['accuracy'])} ({_pct(lo)}–{_pct(hi)}) | {_pct(s['bug_recall'])} "
            f"| {_pct(s['false_alarm'])} | {s['auroc']:.2f} | {_pct(s['trap_fooled'])} | {_pct(s['flip_rate'])} | {s['missing']} |"
        )
    lines += ["", "## So từng cặp giám khảo (McNemar, lượt chấm đầu tiên)", ""]
    gold = {c["id"]: c["gold_correct"] for c in candidates}
    judges = sorted({k[0] for k in m})
    for model in sorted({k[1] for k in m}):
        for a, b in combinations(judges, 2):
            if (a, model) not in m or (b, model) not in m:
                continue
            va, vb = m[(a, model)]["rep0"], m[(b, model)]["rep0"]
            both = [cid for cid in gold if va.get(cid) is not None and vb.get(cid) is not None]
            only_a = sum(va[c] == gold[c] and vb[c] != gold[c] for c in both)
            only_b = sum(va[c] != gold[c] and vb[c] == gold[c] for c in both)
            lines.append(
                f"- **{model}**, {a} vs {b}: chỉ {a} đúng {only_a} bài, chỉ {b} đúng {only_b} bài, "
                f"p = {mcnemar_p(only_a, only_b):.3f} (n = {len(both)})"
            )
    lines += [
        "",
        "## Giám khảo công thức: lỗi nằm ở đâu",
        "",
        "| Model | Liệt kê yêu cầu (so với gold, xấp xỉ) | Tính sai | Verdict trái quy tắc |",
        "|---|---|---|---|",
    ]
    for (judge, model), s in m.items():
        if judge == "formula":
            lines.append(f"| {model} | {_pct(s['req_recall'])} | {_pct(s['arith_err'])} | {_pct(s['rule_break'])} |")
    for label, title in [("source", "Accuracy theo nguồn bài"), ("level", "Accuracy theo độ khó"), ("op", "Accuracy theo loại lỗi cố ý (M + T)")]:
        keys = sorted({k for s in m.values() for k in s["groups"][label]})
        lines += ["", f"## {title}", "", "| | " + " | ".join(f"{j} {mo}" for j, mo in m) + " | n |", "|---|" + "---|" * (len(m) + 1)]
        for k in keys:
            n = sum(1 for c in candidates if {"source": c["source"], "level": c["level"], "op": (c["op"] or "").replace("trap:", "")}[label] == k)
            lines.append(f"| {k} | " + " | ".join(_pct(s["groups"][label].get(k, float("nan"))) for s in m.values()) + f" | {n} |")
    path.write_text("\n".join(lines) + "\n")
    print("\n".join(lines))
