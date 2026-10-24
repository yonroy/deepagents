"""Run the comparison with judges that live outside this process.

Use this when there is no API key for `flow.py` but you can hand files to other
agents (e.g. Claude Code sub-agents): `export` writes batches of anonymized
judging tasks, the agents write one JSON answer file per batch, and `collect`
scores the answers with the same metrics as `flow.py`.

    uv run python external.py export --repeats 2 --batch-size 10
    # ... each agent reads judges/<judge>.md + runs/batches/<batch>.md,
    #     writes runs/answers/<batch>.json
    uv run python external.py collect --label "claude sub-agents"
"""

from __future__ import annotations

import argparse
import json
import random
from pathlib import Path

from dataset import build_candidates
from flow import HERE, Judgement, judge_input, render_report, summarize

JUDGE_FILES = {"rubric": "rubric.md", "formula": "formula.md"}


def export(out: Path, repeats: int, batch_size: int) -> None:
    candidates = build_candidates()
    (out / "batches").mkdir(parents=True, exist_ok=True)
    (out / "answers").mkdir(parents=True, exist_ok=True)
    manifest: dict[str, dict[str, str]] = {}
    for judge_name in JUDGE_FILES:
        for r in range(repeats):
            order = list(range(len(candidates)))
            random.Random(f"{judge_name}:{r}").shuffle(order)
            for b in range(0, len(order), batch_size):
                batch = f"{judge_name}_r{r}_b{b // batch_size}"
                items: dict[str, str] = {}
                parts = [f"# Batch {batch}\n"]
                for k, idx in enumerate(order[b : b + batch_size]):
                    item = f"item-{k + 1:02d}"
                    cand = candidates[idx]
                    items[item] = cand.id
                    parts.append(f"## {item}\n\n{judge_input(cand.ticket.text, cand.ticket.key_points, cand.summary)}\n")
                (out / "batches" / f"{batch}.md").write_text("\n".join(parts))
                manifest[batch] = items
    (out / "manifest.json").write_text(json.dumps(manifest, indent=2))
    print(f"Wrote {len(manifest)} batches to {out / 'batches'}")


def collect(out: Path, label: str) -> None:
    candidates = build_candidates()
    index = {c.id: i for i, c in enumerate(candidates)}
    manifest = json.loads((out / "manifest.json").read_text())
    results: dict[str, list[list[Judgement]]] = {j: [[] for _ in candidates] for j in JUDGE_FILES}
    repeats = 0
    for batch, items in manifest.items():
        judge_name, rep, _ = batch.split("_")
        repeats = max(repeats, int(rep[1:]) + 1)
        path = out / "answers" / f"{batch}.json"
        answers = {a["item"]: a for a in json.loads(path.read_text())} if path.exists() else {}
        for item, cand_id in items.items():
            raw = answers.get(item)
            try:
                judgement = Judgement(float(raw["score"]), raw, 0.0, 0, [])
            except (TypeError, KeyError, ValueError):
                judgement = Judgement(None, {}, 0.0, 0, [], error="missing or invalid answer")
            results[judge_name][index[cand_id]].append(judgement)
    metrics = summarize(candidates, results)
    report = render_report(label, repeats, candidates, results, metrics, [])
    (out / "report.md").write_text(report)
    print(report)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("command", choices=["export", "collect"])
    parser.add_argument("--out", default=str(HERE / "runs"))
    parser.add_argument("--repeats", type=int, default=2)
    parser.add_argument("--batch-size", type=int, default=10)
    parser.add_argument("--label", default="external judges")
    args = parser.parse_args()
    if args.command == "export":
        export(Path(args.out), args.repeats, args.batch_size)
    else:
        collect(Path(args.out), args.label)


if __name__ == "__main__":
    main()
