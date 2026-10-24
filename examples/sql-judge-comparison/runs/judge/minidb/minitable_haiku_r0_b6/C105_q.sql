SELECT t.Name, COUNT(DISTINCT pt.PlaylistId) AS n_playlists FROM Track t JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId GROUP BY t.Name HAVING COUNT(DISTINCT pt.PlaylistId) > 4;
