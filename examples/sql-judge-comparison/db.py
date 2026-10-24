"""Read-only SQL execution against Chinook and result matching for gold labels."""

from __future__ import annotations

import sqlite3
import threading
from collections import Counter
from dataclasses import dataclass
from pathlib import Path
from typing import Any

HERE = Path(__file__).parent
DB_PATH = HERE / "chinook.db"
TIMEOUT_S = 5.0


@dataclass
class Result:
    columns: list[str]
    rows: list[tuple[Any, ...]]
    error: str | None = None


def connect(path: Path = DB_PATH) -> sqlite3.Connection:
    if not path.exists():
        msg = f"{path} not found, run ./download_db.sh first"
        raise FileNotFoundError(msg)
    return sqlite3.connect(f"file:{path}?mode=ro", uri=True, check_same_thread=False)


def run(sql: str, path: Path = DB_PATH) -> Result:
    conn = connect(path)
    timer = threading.Timer(TIMEOUT_S, conn.interrupt)
    timer.start()
    try:
        cur = conn.execute(sql)
        return Result([d[0] for d in cur.description or []], cur.fetchall())
    except sqlite3.Error as e:
        return Result([], [], error=f"{type(e).__name__}: {e}")
    finally:
        timer.cancel()
        conn.close()


def _norm(v: Any) -> Any:
    if isinstance(v, float):
        return round(v, 2)
    return v


def _columns(res: Result) -> list[list[Any]]:
    return [[_norm(r[j]) for r in res.rows] for j in range(len(res.columns))]


def _mappings(gold_cols: list[list[Any]], cand_cols: list[list[Any]], ordered: bool) -> list[list[int]]:
    """All injective gold->candidate column mappings whose columns could match."""
    key = (lambda c: c) if ordered else Counter
    options = [[k for k, c in enumerate(cand_cols) if _hashable_key(key, c) == _hashable_key(key, g)] for g in gold_cols]
    found: list[list[int]] = []

    def walk(j: int, used: list[int]) -> None:
        if len(found) >= 64:  # enough candidates to check
            return
        if j == len(gold_cols):
            found.append(list(used))
            return
        for k in options[j]:
            if k not in used:
                walk(j + 1, [*used, k])

    walk(0, [])
    return found


def _hashable_key(key: Any, col: list[Any]) -> Any:
    k = key(col)
    return tuple(sorted(k.items(), key=repr)) if isinstance(k, Counter) else tuple(k)


def _name_variants(cols: list[list[Any]], start: int = 0) -> list[list[list[Any]]]:
    """`cols` plus versions where adjacent text columns (first, last name) are joined with a space."""
    out = [cols]
    for j in range(start, len(cols) - 1):
        a, b = cols[j], cols[j + 1]
        if all(isinstance(v, str) or v is None for v in a + b):
            joined = [None if x is None and y is None else f"{x} {y}" for x, y in zip(a, b, strict=True)]
            out += _name_variants([*cols[:j], joined, *cols[j + 2 :]], j + 1)
    return out


def _matches_cols(gold_cols: list[list[Any]], cand_cols: list[list[Any]], *, order_matters: bool) -> bool:
    n_rows = len(gold_cols[0]) if gold_cols else 0
    gold_rows = [tuple(c[i] for c in gold_cols) for i in range(n_rows)]
    for mapping in _mappings(gold_cols, cand_cols, order_matters):
        projected = [tuple(cand_cols[k][i] for k in mapping) for i in range(n_rows)]
        if projected == gold_rows if order_matters else Counter(projected) == Counter(gold_rows):
            return True
    return False


def matches(gold: Result, cand: Result, *, order_matters: bool) -> bool:
    """True when every gold column appears in the candidate with the same rows.

    Extra candidate columns, renamed columns, a different column order and a
    full name in one column instead of first/last name columns are allowed.
    Rows are compared as a multiset unless `order_matters`.
    """
    if gold.error or cand.error or len(gold.rows) != len(cand.rows):
        return False
    cand_cols = _columns(cand)
    return any(_matches_cols(g, cand_cols, order_matters=order_matters) for g in _name_variants(_columns(gold)))


def schema_markdown(path: Path = DB_PATH, sample_rows: int = 3) -> str:
    """DDL plus a few sample rows per table, as given to agents and judges."""
    conn = connect(path)
    parts = ["# Chinook schema (SQLite)\n"]
    tables = conn.execute("SELECT name, sql FROM sqlite_master WHERE type='table' ORDER BY name").fetchall()
    for name, ddl in tables:
        parts.append(f"## {name}\n\n```sql\n{ddl.strip()}\n```\n")
        if sample_rows:
            cur = conn.execute(f'SELECT * FROM "{name}" LIMIT {sample_rows}')  # table names come from sqlite_master
            cols = [d[0] for d in cur.description]
            rows = cur.fetchall()
            parts.append("| " + " | ".join(cols) + " |\n|" + "---|" * len(cols))
            parts += ["| " + " | ".join("NULL" if v is None else str(v) for v in r) + " |" for r in rows]
            parts.append("")
    conn.close()
    return "\n".join(parts)
