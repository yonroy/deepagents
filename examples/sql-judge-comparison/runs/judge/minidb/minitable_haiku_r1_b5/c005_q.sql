SELECT COUNT(*) AS n_tracks FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId;
