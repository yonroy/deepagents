"""Run a query on a throwaway SQLite database that has the Chinook schema but no rows.

Tool for the `minitable` judge: it writes its own tiny fixture (INSERT statements),
then runs the candidate SQL on it. The real Chinook data is never visible here.

    uv run python minidb.py <fixture.sql> <query.sql | "SELECT ...">
"""

from __future__ import annotations

import sqlite3
import sys
from pathlib import Path

from db import DB_PATH, Result, connect

HERE = Path(__file__).parent
SANDBOX = HERE / "runs" / "judge" / "minidb"


def schema_ddl(path: Path = DB_PATH) -> list[str]:
    conn = connect(path)
    ddl = [row[0] for row in conn.execute("SELECT sql FROM sqlite_master WHERE type = 'table' ORDER BY name")]
    conn.close()
    return ddl


def run_on_fixture(fixture_sql: str, query: str) -> Result:
    """Create an empty Chinook-shaped database, load `fixture_sql`, run `query`."""
    conn = sqlite3.connect(":memory:")
    try:
        for stmt in schema_ddl():
            conn.execute(stmt)
        try:
            conn.executescript(fixture_sql)
        except sqlite3.Error as e:
            return Result([], [], error=f"fixture error: {type(e).__name__}: {e}")
        try:
            cur = conn.execute(query)
            return Result([d[0] for d in cur.description or []], cur.fetchall())
        except sqlite3.Error as e:
            return Result([], [], error=f"{type(e).__name__}: {e}")
    finally:
        conn.close()


def _read(arg: str) -> str:
    path = Path(arg)
    return path.read_text() if path.suffix == ".sql" and path.exists() else arg


def main() -> None:
    if len(sys.argv) != 3:
        print(__doc__)
        sys.exit(2)
    fixture = Path(sys.argv[1]).resolve()
    if SANDBOX.resolve() not in fixture.parents:
        print(f"fixture must live under {SANDBOX}")
        sys.exit(2)
    res = run_on_fixture(fixture.read_text(), _read(sys.argv[2]))
    if res.error:
        print(res.error)
        return
    print(res.columns)
    for row in res.rows[:50]:
        print(row)
    print(f"({len(res.rows)} rows)")


if __name__ == "__main__":
    main()
