SELECT COUNT(DISTINCT g.GenreId) AS genre_count FROM Genre g JOIN Track t ON t.GenreId = g.GenreId;
