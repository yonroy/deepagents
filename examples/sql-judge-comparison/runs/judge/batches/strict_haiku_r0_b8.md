# Batch strict_haiku_r0_b8

## C014

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title, COUNT(t.TrackId) AS n_tracks FROM Album al JOIN Artist ar ON ar.ArtistId = al.ArtistId JOIN Track t ON t.AlbumId = al.AlbumId WHERE ar.Name = 'Iron Maiden' GROUP BY ar.ArtistId;
```

## C031

CÂU HỎI: Playlist tên 'Grunge' có bao nhiêu bài hát?

```sql
SELECT COUNT(*) FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId=pt.PlaylistId WHERE p.Name='Grunge';
```

## C045

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name AS ArtistName, COUNT(al.AlbumId) AS AlbumCount FROM Artist ar JOIN Album al ON al.ArtistId = ar.ArtistId GROUP BY ar.ArtistId, ar.Name HAVING COUNT(al.AlbumId) > 10 ORDER BY AlbumCount DESC;
```

## C009

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name AS Genre, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS Revenue FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId, g.Name ORDER BY Revenue DESC LIMIT 5;
```

## C055

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName, c.LastName, ROUND(SUM(i.Total), 2) AS spent FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId GROUP BY c.CustomerId ORDER BY spent DESC LIMIT 5;
```

## C051

CÂU HỎI: Với mỗi quốc gia, khách hàng nào chi tiêu nhiều nhất từ trước đến nay? Cho biết quốc gia, họ tên và tổng tiền (nếu hòa thì liệt kê tất cả).

```sql
WITH spend AS (SELECT c.Country, c.CustomerId, c.FirstName || ' ' || c.LastName AS full_name, SUM(i.Total) AS total FROM Customer c JOIN Invoice i ON i.CustomerId = c.CustomerId WHERE c.Country IS NOT NULL GROUP BY c.CustomerId, c.Country, c.FirstName, c.LastName), ranked AS (SELECT Country, full_name, total, RANK() OVER (PARTITION BY Country ORDER BY total DESC) AS rk FROM spend) SELECT Country, full_name, ROUND(total, 2) AS total_spent FROM ranked WHERE rk = 1;
```

## C036

CÂU HỎI: Những bài hát nào nằm trong nhiều hơn 4 playlist khác nhau? Cho biết tên bài và số playlist.

```sql
SELECT t.Name AS TrackName, COUNT(DISTINCT pt.PlaylistId) AS PlaylistCount FROM Track t JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId GROUP BY t.TrackId, t.Name HAVING COUNT(DISTINCT pt.PlaylistId) > 4 ORDER BY PlaylistCount DESC;
```

## C053

CÂU HỎI: Có bao nhiêu nghệ sĩ chưa từng bán được bài hát nào (tính cả nghệ sĩ không có album nào)?

```sql
SELECT COUNT(*) AS artist_count FROM Artist ar WHERE NOT EXISTS (SELECT 1 FROM Album al JOIN Track t ON t.AlbumId = al.AlbumId JOIN InvoiceLine il ON il.TrackId = t.TrackId WHERE al.ArtistId = ar.ArtistId);
```

## C047

CÂU HỎI: Tỷ lệ phần trăm doanh thu bán lẻ của từng loại media trên tổng doanh thu (làm tròn 2 chữ số).

```sql
SELECT m.Name AS media_type, ROUND(100.0 * SUM(il.UnitPrice * il.Quantity) / (SELECT SUM(UnitPrice * Quantity) FROM InvoiceLine), 2) AS revenue_percent FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN MediaType m ON m.MediaTypeId = t.MediaTypeId GROUP BY m.MediaTypeId, m.Name ORDER BY revenue_percent DESC;
```

## C093

CÂU HỎI: Tính tổng số bài hát khác nhau thuộc các playlist có tên 'Music' (lưu ý có thể có nhiều playlist trùng tên).

```sql
SELECT COUNT(DISTINCT pt.TrackId) AS distinct_track_count FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId WHERE p.Name = 'Music';
```
