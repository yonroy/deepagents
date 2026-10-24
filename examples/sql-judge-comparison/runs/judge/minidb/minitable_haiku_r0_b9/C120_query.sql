SELECT COUNT(DISTINCT pt.TrackId) AS distinct_track_count FROM Playlist p JOIN PlaylistTrack pt ON pt.PlaylistId = p.PlaylistId WHERE p.Name = 'Music';
