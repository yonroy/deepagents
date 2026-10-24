"""Run generation and judging with agents outside this process (no API key needed).

Each step writes task files for agents to read and collects the JSON files they write back.

    uv run python external.py export-gen        # runs/gen/<config>_b<k>.md
    #   ... agents write runs/gen/answers/<config>_b<k>.json: [{"qid", "sql"}]
    uv run python external.py build             # runs/candidates.json (gold labels by execution)
    uv run python external.py export-judge      # runs/judge/batches/<judge>_<model>_r<r>_b<k>.md
    #   ... agents write runs/judge/answers/<same name>.json
    uv run python external.py report            # runs/report.md

Agents only ever see questions, schema and SQL. Gold SQL, sources and labels stay in
`questions.yaml` and `runs/candidates.json`, which they are told not to open.
"""

from __future__ import annotations

import argparse
import json
import random
import re
from pathlib import Path
from typing import Any

from db import matches, run
from mutate import load_questions, mutations, trap

HERE = Path(__file__).parent
RUNS = HERE / "runs"

GEN_CONFIGS = ["G1", "G2", "G3"]
JUDGES = ["rubric", "formula", "minitable"]
# (model, repeats) for the judging grid
JUDGE_RUNS = [("haiku", 2), ("sonnet", 1)]


def export_gen(batch_size: int) -> None:
    out = RUNS / "gen"
    (out / "answers").mkdir(parents=True, exist_ok=True)
    questions = load_questions()
    for config in GEN_CONFIGS:
        for b in range(0, len(questions), batch_size):
            lines = [f"# Questions {config} batch {b // batch_size}\n"]
            lines += [f"## {q['id']}\n\n{q['question']}\n" for q in questions[b : b + batch_size]]
            (out / f"{config}_b{b // batch_size}.md").write_text("\n".join(lines))
    print(f"Wrote generation batches to {out}")


def _normalize_sql(sql: str) -> str:
    return re.sub(r"\s+", " ", sql.strip().rstrip(";")).lower()


def build(seed: int = 11) -> None:
    questions = {q["id"]: q for q in load_questions()}
    pool: list[dict[str, Any]] = []
    for path in sorted((RUNS / "gen" / "answers").glob("*.json")):
        config = path.stem.split("_")[0]
        for a in json.loads(path.read_text()):
            pool.append({"qid": a["qid"], "sql": a["sql"], "source": config, "op": None})
    for q in questions.values():
        pool += [{"qid": q["id"], "sql": m.sql, "source": "M", "op": m.op} for m in mutations(q)]
        if (t := trap(q)) is not None:
            pool.append({"qid": q["id"], "sql": t.sql, "source": "T", "op": t.op})

    # Identical SQL for the same question is judged once; keep every source that produced it.
    merged: dict[tuple[str, str], dict[str, Any]] = {}
    for c in pool:
        key = (c["qid"], _normalize_sql(c["sql"]))
        if key in merged:
            merged[key]["sources"].append(c["source"])
        else:
            merged[key] = {**c, "sources": [c["source"]]}

    rng = random.Random(seed)
    candidates = list(merged.values())
    rng.shuffle(candidates)
    for i, c in enumerate(candidates):
        q = questions[c["qid"]]
        res = run(c["sql"])
        c["id"] = f"C{i + 1:03d}"
        c["level"] = q["level"]
        c["gold_correct"] = matches(run(q["gold_sql"]), res, order_matters=q["order_matters"])
        c["exec_error"] = res.error
    (RUNS / "candidates.json").write_text(json.dumps(candidates, ensure_ascii=False, indent=2))
    n_ok = sum(c["gold_correct"] for c in candidates)
    print(f"{len(candidates)} candidates, {n_ok} correct ({n_ok / len(candidates):.0%})")
    for src in [*GEN_CONFIGS, "M", "T"]:
        group = [c for c in candidates if c["source"] == src]
        if group:
            print(f"  {src}: {len(group)} unique, {sum(c['gold_correct'] for c in group)} correct")


def _batches(candidates: list[dict[str, Any]], size: int, rng: random.Random) -> list[list[dict[str, Any]]]:
    """Pack candidates into batches of `size` with no two from the same question."""
    order = candidates[:]
    rng.shuffle(order)
    batches: list[list[dict[str, Any]]] = []
    for c in sorted(order, key=lambda c: -sum(o["qid"] == c["qid"] for o in order)):
        for b in batches:
            if len(b) < size and all(o["qid"] != c["qid"] for o in b):
                b.append(c)
                break
        else:
            batches.append([c])
    return batches


def display_sql(sql: str) -> str:
    """One formatting for every candidate, so layout can't hint at where it came from.

    Comment lines are kept on their own lines; the SQL itself is collapsed to one line.
    """
    lines = [ln.strip() for ln in sql.strip().splitlines() if ln.strip()]
    comments = [ln for ln in lines if ln.startswith("--")]
    code = " ".join(ln for ln in lines if not ln.startswith("--"))
    return "\n".join([*comments, re.sub(r"\s+", " ", code).rstrip(";").strip() + ";"])


def export_judge(batch_size: int, judges: list[str]) -> None:
    candidates = json.loads((RUNS / "candidates.json").read_text())
    questions = {q["id"]: q for q in load_questions()}
    out = RUNS / "judge"
    (out / "batches").mkdir(parents=True, exist_ok=True)
    (out / "answers").mkdir(parents=True, exist_ok=True)
    names = []
    for judge in judges:
        for model, repeats in JUDGE_RUNS:
            for r in range(repeats):
                rng = random.Random(f"{judge}:{model}:{r}")
                for k, batch in enumerate(_batches(candidates, batch_size, rng)):
                    name = f"{judge}_{model}_r{r}_b{k}"
                    parts = [f"# Batch {name}\n"]
                    for c in batch:
                        parts.append(f"## {c['id']}\n\nCÂU HỎI: {questions[c['qid']]['question']}\n\n```sql\n{display_sql(c['sql'])}\n```\n")
                    (out / "batches" / f"{name}.md").write_text("\n".join(parts))
                    names.append(name)
    print(f"Wrote {len(names)} judge batches to {out / 'batches'}")


def load_judgements() -> dict[tuple[str, str, int], dict[str, dict[str, Any]]]:
    """{(judge, model, repeat): {candidate_id: answer}}."""
    out: dict[tuple[str, str, int], dict[str, dict[str, Any]]] = {}
    for path in sorted((RUNS / "judge" / "answers").glob("*.json")):
        judge, model, rep, _ = path.stem.split("_")
        bucket = out.setdefault((judge, model, int(rep[1:])), {})
        text = path.read_text()
        # Take the first JSON array; a few agents appended stray text after it.
        answers, _ = json.JSONDecoder().raw_decode(text[text.index("[") :])
        for a in answers:
            bucket[a["item"]] = a
    return out


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("command", choices=["export-gen", "build", "export-judge", "report"])
    parser.add_argument("--batch-size", type=int, default=10)
    parser.add_argument("--judges", default=",".join(JUDGES), help="export-judge: comma-separated judges to write batches for")
    args = parser.parse_args()
    if args.command == "export-gen":
        export_gen(args.batch_size)
    elif args.command == "build":
        build()
    elif args.command == "export-judge":
        export_judge(args.batch_size, args.judges.split(","))
    else:
        from metrics import write_report

        write_report(json.loads((RUNS / "candidates.json").read_text()), load_judgements(), RUNS / "report.md")


if __name__ == "__main__":
    main()
