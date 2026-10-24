SELECT COUNT(*) FROM Artist ar WHERE NOT EXISTS (SELECT 1 FROM Album al JOIN Track t ON t.AlbumId=al.AlbumId JOIN InvoiceLine il ON il.TrackId=t.TrackId WHERE al.ArtistId=ar.ArtistId);
