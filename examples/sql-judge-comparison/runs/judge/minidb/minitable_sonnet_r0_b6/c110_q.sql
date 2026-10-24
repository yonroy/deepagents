SELECT g.Name, ROUND(AVG(t.Milliseconds) / 1000.0, 2) AS avg_minutes FROM Track t JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId ORDER BY AVG(t.Milliseconds) DESC LIMIT 3;
