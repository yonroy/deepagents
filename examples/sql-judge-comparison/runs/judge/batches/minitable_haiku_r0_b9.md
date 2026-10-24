# Batch minitable_haiku_r0_b9

## C064

CÂU HỎI: Những quốc gia nào có từ 5 khách hàng trở lên? Cho biết số khách hàng của từng nước.

```sql
SELECT Country, COUNT(*) AS n_customers FROM Customer GROUP BY Country HAVING COUNT(*) > 5;
```

## C090

CÂU HỎI: Có bao nhiêu nghệ sĩ chưa từng bán được bài hát nào (tính cả nghệ sĩ không có album nào)?

```sql
SELECT COUNT(*) AS n_artists FROM Artist ar WHERE EXISTS (SELECT 1 FROM Album a2 WHERE a2.ArtistId = ar.ArtistId) AND NOT EXISTS ( SELECT 1 FROM Album al JOIN Track t ON t.AlbumId = al.AlbumId JOIN InvoiceLine il ON il.TrackId = t.TrackId WHERE al.ArtistId = ar.ArtistId );
```

## C101

CÂU HỎI: Playlist tên 'Grunge' có bao nhiêu bài hát?

```sql
SELECT COUNT(pt.TrackId) AS track_count FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId WHERE p.Name = 'Grunge';
```

## C070

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName || ' ' || c.LastName AS customer_name, ROUND(SUM(i.Total), 2) AS total_spent FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId WHERE strftime('%Y', i.InvoiceDate) = '2024' GROUP BY c.CustomerId, c.FirstName, c.LastName ORDER BY total_spent DESC LIMIT 5;
```

## C059

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name, COUNT(*) AS n FROM Artist ar JOIN Album al ON al.ArtistId=ar.ArtistId GROUP BY ar.ArtistId HAVING n>10;
```

## C120

CÂU HỎI: Tính tổng số bài hát khác nhau thuộc các playlist có tên 'Music' (lưu ý có thể có nhiều playlist trùng tên).

```sql
SELECT COUNT(DISTINCT pt.TrackId) AS distinct_track_count FROM Playlist p JOIN PlaylistTrack pt ON pt.PlaylistId = p.PlaylistId WHERE p.Name = 'Music';
```

## C016

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title AS album, COUNT(t.TrackId) AS track_count FROM Album al JOIN Artist ar ON ar.ArtistId = al.ArtistId LEFT JOIN Track t ON t.AlbumId = al.AlbumId WHERE ar.Name = 'Iron Maiden' GROUP BY al.AlbumId, al.Title ORDER BY al.Title;
```

## C013

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name AS genre, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId ORDER BY revenue ASC LIMIT 5;
```

## C121

CÂU HỎI: Với mỗi quốc gia, khách hàng nào chi tiêu nhiều nhất từ trước đến nay? Cho biết quốc gia, họ tên và tổng tiền (nếu hòa thì liệt kê tất cả).

```sql
WITH spent AS ( SELECT c.Country, c.CustomerId, c.FirstName, c.LastName, SUM(i.Total) AS total FROM Customer c JOIN Invoice i ON i.CustomerId = c.CustomerId GROUP BY c.CustomerId ) SELECT Country, FirstName, LastName, ROUND(total, 2) AS total FROM spent s WHERE total = (SELECT MAX(total) FROM spent s2 );
```

## C075

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) năm 2025 tăng hay giảm bao nhiêu phần trăm so với năm 2024? (làm tròn 2 chữ số, số âm nghĩa là giảm)

```sql
SELECT ROUND(100.0 * (SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2025' THEN Total ELSE 0 END) - SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2024' THEN Total ELSE 0 END)) / SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2024' THEN Total ELSE 0 END), 2) AS pct_change FROM Invoice;
```
