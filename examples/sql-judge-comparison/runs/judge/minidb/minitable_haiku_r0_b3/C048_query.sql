-- Chỉ xét nghệ sĩ có album thì mới có bài hát để bán; nghệ sĩ không có album hiển nhiên
-- không bán được gì nên đã được bao hàm trong điều kiện NOT EXISTS. Kết quả an toàn.
SELECT COUNT(*) AS n_artists FROM Artist ar WHERE EXISTS (SELECT 1 FROM Album a2 WHERE a2.ArtistId = ar.ArtistId) AND NOT EXISTS ( SELECT 1 FROM Album al JOIN Track t ON t.AlbumId = al.AlbumId JOIN InvoiceLine il ON il.TrackId = t.TrackId WHERE al.ArtistId = ar.ArtistId );
