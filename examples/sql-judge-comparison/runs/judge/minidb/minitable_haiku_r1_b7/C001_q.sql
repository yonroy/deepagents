SELECT COUNT(pt.TrackId) AS track_count FROM Playlist p JOIN PlaylistTrack pt ON pt.PlaylistId = p.PlaylistId WHERE p.Name = 'Grunge';
