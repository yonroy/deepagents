from minidb import run_on_fixture


def test_starts_empty_and_never_sees_real_data():
    assert run_on_fixture("", "SELECT COUNT(*) FROM Artist").rows == [(0,)]


def test_fixture_rows_are_queryable():
    fixture = "INSERT INTO Artist VALUES (1, 'A'), (2, 'B');"
    res = run_on_fixture(fixture, "SELECT Name FROM Artist ORDER BY ArtistId")
    assert res.rows == [("A",), ("B",)]


def test_errors_are_reported():
    assert run_on_fixture("INSERT INTO Nope VALUES (1);", "SELECT 1").error.startswith("fixture error")
    assert run_on_fixture("", "SELECT * FROM Nope").error
