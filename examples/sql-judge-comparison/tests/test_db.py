import pytest

from db import Result, matches, run
from mutate import apply, load_questions, mutations, trap


def r(cols, rows):
    return Result(cols, rows)


def test_extra_and_reordered_columns_match():
    gold = r(["name", "n"], [("a", 1), ("b", 2)])
    cand = r(["n", "id", "artist"], [(2, 9, "b"), (1, 8, "a")])
    assert matches(gold, cand, order_matters=False)


def test_order_matters():
    gold = r(["x"], [(1,), (2,)])
    cand = r(["x"], [(2,), (1,)])
    assert matches(gold, cand, order_matters=False)
    assert not matches(gold, cand, order_matters=True)


def test_rows_must_align_across_columns():
    gold = r(["name", "n"], [("a", 1), ("b", 2)])
    cand = r(["name", "n"], [("a", 2), ("b", 1)])
    assert not matches(gold, cand, order_matters=False)


def test_float_rounding_and_duplicates():
    assert matches(r(["v"], [(1.234,)]), r(["v"], [(1.2349,)]), order_matters=False)
    assert not matches(r(["v"], [(1,), (1,)]), r(["v"], [(1,), (2,)]), order_matters=False)


def test_errors_never_match():
    gold = run("SELECT 1")
    assert not matches(gold, run("SELEC 1"), order_matters=False)
    assert run("SELECT * FROM NoSuchTable").error


def test_read_only():
    assert run("DELETE FROM Artist").error


@pytest.mark.parametrize("q", load_questions(), ids=lambda q: q["id"])
def test_gold_runs_and_every_mutation_changes_result(q):
    gold = run(q["gold_sql"])
    assert gold.error is None
    assert matches(gold, run(q["gold_sql"]), order_matters=q["order_matters"])
    for m in [*mutations(q), *filter(None, [trap(q)])]:
        assert not matches(gold, run(m.sql), order_matters=q["order_matters"]), m.op


def test_apply_requires_unique_anchor():
    assert apply("a b", "a", "c") == "c b"
    with pytest.raises(ValueError, match="2 times"):
        apply("a a", "a", "c")


def test_full_name_column_matches_first_last():
    gold = r(["first", "last", "n"], [("Jane", "Peacock", 21), ("Andrew", "Adams", 0)])
    assert matches(gold, r(["name", "n"], [("Jane Peacock", 21), ("Andrew Adams", 0)]), order_matters=False)
    assert not matches(gold, r(["name", "n"], [("Jane Peacock", 0), ("Andrew Adams", 21)]), order_matters=False)
    two = r(["f", "l", "mf", "ml"], [("Nancy", "Edwards", "Andrew", "Adams"), ("Andrew", "Adams", None, None)])
    assert matches(two, r(["e", "m"], [("Nancy Edwards", "Andrew Adams"), ("Andrew Adams", None)]), order_matters=False)
