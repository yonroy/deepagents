SELECT COUNT(DISTINCT pt.TrackId) FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId=pt.PlaylistId WHERE p.Name='Music';
