SELECT t.Name, COUNT(DISTINCT pt.PlaylistId) AS n FROM Track t JOIN PlaylistTrack pt ON pt.TrackId=t.TrackId GROUP BY t.TrackId HAVING n>4;
