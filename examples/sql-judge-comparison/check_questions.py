"""Run every gold SQL and mutation; show results and flag mutations that don't change the answer."""

from __future__ import annotations

from db import matches, run
from mutate import load_questions, mutations, trap

for q in load_questions():
    gold = run(q["gold_sql"])
    head = gold.error or f"{len(gold.rows)} rows: {gold.rows[:3]}"
    print(f"{q['id']} [{q['level']}] {head}")
    for m in [*mutations(q), *filter(None, [trap(q)])]:
        res = run(m.sql)
        same = matches(gold, res, order_matters=q["order_matters"])
        flag = "SAME (no effect!)" if same else "changed"
        print(f"    {m.op:<22} {flag:<18} {res.error or f'{len(res.rows)} rows: {res.rows[:2]}'}")
