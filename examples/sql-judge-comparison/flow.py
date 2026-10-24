"""Run generation and judging with deep agents through an API (needs ANTHROPIC_API_KEY).

Writes the same files as the sub-agent route in `external.py`, so the rest of the
pipeline is shared:

    uv run python external.py export-gen
    uv run python flow.py gen                 # runs/gen/answers/*.json
    uv run python external.py build
    uv run python external.py export-judge
    uv run python flow.py judge               # runs/judge/answers/*.json
    uv run python external.py report

Each batch is one deep agent run. The agent gets the instruction and schema files in
its virtual filesystem and must `read_file` them; generator G1 also gets a read-only
`run_sql` tool.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

from deepagents import create_deep_agent
from deepagents.backends.utils import create_file_data
from langchain_core.messages import HumanMessage
from langchain_core.tools import tool

from db import run
from external import RUNS

HERE = Path(__file__).parent
MODELS = {"haiku": "anthropic:claude-haiku-5-5", "sonnet": "anthropic:claude-sonnet-5-5"}
GEN_MODELS = {"G1": "sonnet", "G2": "haiku", "G3": "haiku"}


@tool
def run_sql(sql: str) -> str:
    """Run one read-only SQLite query on Chinook and return up to 20 rows."""
    res = run(sql)
    if res.error:
        return res.error
    return "\n".join([str(res.columns), *map(str, res.rows[:20]), f"({len(res.rows)} rows)"])


def _answer_array(text: str) -> list[dict[str, Any]]:
    """The first JSON array in the agent's final message."""
    start = text.index("[")
    answers, _ = json.JSONDecoder().raw_decode(text[start:])
    return answers


def _final_text(result: dict[str, Any]) -> str:
    content = result["messages"][-1].content
    return content if isinstance(content, str) else "".join(p.get("text", "") for p in content if isinstance(p, dict))


def _run_batch(model: str, files: dict[str, str], prompt: str, tools: list[Any] | None = None) -> list[dict[str, Any]]:
    agent = create_deep_agent(model=MODELS[model], tools=tools or [])
    result = agent.invoke(
        {
            "messages": [HumanMessage(content=prompt)],
            "files": {path: create_file_data(content) for path, content in files.items()},
        }
    )
    return _answer_array(_final_text(result))


def generate() -> None:
    for batch in sorted((RUNS / "gen").glob("G*_b*.md")):
        config = batch.stem.split("_")[0]
        schema = "schema_no_samples.md" if config == "G3" else "schema.md"
        files = {"/schema.md": (RUNS / schema).read_text(), "/questions.md": batch.read_text()}
        prompt = (
            "Đọc /schema.md và /questions.md. Viết một câu SQLite cho mỗi câu hỏi"
            + (", chạy thử bằng run_sql và sửa nếu cần" if config == "G1" else "")
            + '. Trả lời bằng đúng một mảng JSON: [{"qid": "...", "sql": "..."}, ...].'
        )
        answers = _run_batch(GEN_MODELS[config], files, prompt, [run_sql] if config == "G1" else None)
        (RUNS / "gen" / "answers" / f"{batch.stem}.json").write_text(json.dumps(answers, ensure_ascii=False, indent=2))
        print(f"[gen] {batch.stem}: {len(answers)} queries")


def judge() -> None:
    out = RUNS / "judge" / "answers"
    for batch in sorted((RUNS / "judge" / "batches").glob("*.md")):
        if (out / f"{batch.stem}.json").exists():
            continue
        judge_name, model, _, _ = batch.stem.split("_")
        files = {
            f"/{judge_name}.md": (HERE / "judges" / f"{judge_name}.md").read_text(),
            "/schema.md": (RUNS / "schema.md").read_text(),
            "/batch.md": batch.read_text(),
        }
        prompt = (
            f"Bạn là giám khảo. Đọc /{judge_name}.md (hướng dẫn chấm, làm đúng theo), /schema.md và /batch.md. "
            "Chấm từng bài độc lập. Trả lời bằng đúng một mảng JSON, mỗi bài một object theo định dạng trong hướng dẫn."
        )
        answers = _run_batch(model, files, prompt)
        (out / f"{batch.stem}.json").write_text(json.dumps(answers, ensure_ascii=False, indent=2))
        print(f"[judge] {batch.stem}: {len(answers)} answers")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("command", choices=["gen", "judge"])
    args = parser.parse_args()
    generate() if args.command == "gen" else judge()


if __name__ == "__main__":
    main()
