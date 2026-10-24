# Batch strict_haiku_r1_b9

## C074

CÂU HỎI: Tỷ lệ phần trăm doanh thu bán lẻ của từng loại media trên tổng doanh thu (làm tròn 2 chữ số).

```sql
SELECT m.Name, ROUND(100.0*SUM(il.UnitPrice*il.Quantity)/(SELECT SUM(UnitPrice*Quantity) FROM InvoiceLine),2) AS pct FROM InvoiceLine il JOIN Track t ON t.TrackId=il.TrackId JOIN MediaType m ON m.MediaTypeId=t.MediaTypeId GROUP BY m.MediaTypeId;
```

## C089

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name AS genre, ROUND(AVG(il.UnitPrice * il.Quantity), 2) AS revenue FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId ORDER BY revenue DESC LIMIT 5;
```

## C121

CÂU HỎI: Với mỗi quốc gia, khách hàng nào chi tiêu nhiều nhất từ trước đến nay? Cho biết quốc gia, họ tên và tổng tiền (nếu hòa thì liệt kê tất cả).

```sql
WITH spent AS ( SELECT c.Country, c.CustomerId, c.FirstName, c.LastName, SUM(i.Total) AS total FROM Customer c JOIN Invoice i ON i.CustomerId = c.CustomerId GROUP BY c.CustomerId ) SELECT Country, FirstName, LastName, ROUND(total, 2) AS total FROM spent s WHERE total = (SELECT MAX(total) FROM spent s2 );
```

## C041

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) năm 2025 tăng hay giảm bao nhiêu phần trăm so với năm 2024? (làm tròn 2 chữ số, số âm nghĩa là giảm)

```sql
SELECT ROUND(100.0 * (SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2025' THEN Total END) - SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2024' THEN Total END)) / SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2024' THEN Total END), 2) AS pct_change FROM Invoice WHERE strftime('%Y', InvoiceDate) IN ('2024', '2025');
```

## C044

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name, COUNT(*) AS n_albums FROM Artist ar JOIN Album al ON al.ArtistId = ar.ArtistId JOIN Track t ON t.AlbumId = al.AlbumId GROUP BY ar.ArtistId HAVING COUNT(*) > 10;
```

## C014

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title, COUNT(t.TrackId) AS n_tracks FROM Album al JOIN Artist ar ON ar.ArtistId = al.ArtistId JOIN Track t ON t.AlbumId = al.AlbumId WHERE ar.Name = 'Iron Maiden' GROUP BY ar.ArtistId;
```

## C003

CÂU HỎI: 3 nghệ sĩ có doanh thu bán lẻ cao nhất từ khách hàng ở Đức (Germany) trong năm 2024, kèm doanh thu, từ cao xuống thấp.

```sql
SELECT ar.Name AS artist_name, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue FROM InvoiceLine il JOIN Invoice i ON i.InvoiceId = il.InvoiceId JOIN Customer c ON c.CustomerId = i.CustomerId JOIN Track t ON t.TrackId = il.TrackId JOIN Album al ON al.AlbumId = t.AlbumId JOIN Artist ar ON ar.ArtistId = al.ArtistId WHERE c.Country = 'Germany' AND strftime('%Y', i.InvoiceDate) = '2024' GROUP BY ar.ArtistId, ar.Name ORDER BY revenue DESC LIMIT 3;
```

## C100

CÂU HỎI: 3 thể loại có thời lượng bài hát trung bình dài nhất, tính bằng phút (làm tròn 2 chữ số), từ dài đến ngắn.

```sql
SELECT g.Name, ROUND(AVG(t.Milliseconds)/60000.0,2) AS avg_min FROM Track t JOIN Genre g ON g.GenreId=t.GenreId GROUP BY g.GenreId ORDER BY AVG(t.Milliseconds) DESC LIMIT 3;
```

## C120

CÂU HỎI: Tính tổng số bài hát khác nhau thuộc các playlist có tên 'Music' (lưu ý có thể có nhiều playlist trùng tên).

```sql
SELECT COUNT(DISTINCT pt.TrackId) AS distinct_track_count FROM Playlist p JOIN PlaylistTrack pt ON pt.PlaylistId = p.PlaylistId WHERE p.Name = 'Music';
```

## C053

CÂU HỎI: Có bao nhiêu nghệ sĩ chưa từng bán được bài hát nào (tính cả nghệ sĩ không có album nào)?

```sql
SELECT COUNT(*) AS artist_count FROM Artist ar WHERE NOT EXISTS (SELECT 1 FROM Album al JOIN Track t ON t.AlbumId = al.AlbumId JOIN InvoiceLine il ON il.TrackId = t.TrackId WHERE al.ArtistId = ar.ArtistId);
```
