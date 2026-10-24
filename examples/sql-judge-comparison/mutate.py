"""Build the candidate pool: deliberate mutations of gold SQL and judge traps."""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Any

import yaml

HERE = Path(__file__).parent


@dataclass
class Mutation:
    op: str
    sql: str


def load_questions(path: Path = HERE / "questions.yaml") -> list[dict[str, Any]]:
    return yaml.safe_load(path.read_text())


def apply(sql: str, src: str, dst: str) -> str:
    """Replace `src` with `dst` exactly once; fail loudly if the anchor drifted."""
    count = sql.count(src)
    if count != 1:
        msg = f"mutation anchor found {count} times, expected 1: {src!r}"
        raise ValueError(msg)
    return sql.replace(src, dst)


def mutations(question: dict[str, Any]) -> list[Mutation]:
    return [Mutation(m["op"], apply(question["gold_sql"], m["from"], m["to"])) for m in question.get("mutations", [])]


def trap(question: dict[str, Any]) -> Mutation | None:
    spec = question.get("trap")
    if not spec:
        return None
    base = mutations(question)[spec["mutation"]]
    return Mutation(f"trap:{base.op}", spec["comment"].rstrip() + "\n" + base.sql)
