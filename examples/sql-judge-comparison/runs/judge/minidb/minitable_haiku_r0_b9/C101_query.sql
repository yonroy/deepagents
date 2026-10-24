SELECT COUNT(pt.TrackId) AS track_count FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId WHERE p.Name = 'Grunge';
