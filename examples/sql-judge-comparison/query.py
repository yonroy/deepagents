"""Run one read-only SQL query on Chinook and print up to 20 rows (tool for generator agents)."""

import sys

from db import run

res = run(sys.argv[1])
if res.error:
    print(res.error)
else:
    print(res.columns)
    for row in res.rows[:20]:
        print(row)
    print(f"({len(res.rows)} rows)")
