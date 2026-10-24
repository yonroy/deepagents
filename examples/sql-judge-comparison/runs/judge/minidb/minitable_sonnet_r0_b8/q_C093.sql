SELECT COUNT(DISTINCT pt.TrackId) AS distinct_track_count FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId WHERE p.Name = 'Music';
