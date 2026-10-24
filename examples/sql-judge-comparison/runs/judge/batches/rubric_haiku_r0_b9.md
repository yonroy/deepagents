# Batch rubric_haiku_r0_b9

## C043

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title, COUNT(t.TrackId) AS n FROM Album al JOIN Artist ar ON ar.ArtistId=al.ArtistId LEFT JOIN Track t ON t.AlbumId=al.AlbumId WHERE ar.Name='Iron Maiden' GROUP BY al.AlbumId;
```

## C033

CÂU HỎI: Tính tổng số bài hát khác nhau thuộc các playlist có tên 'Music' (lưu ý có thể có nhiều playlist trùng tên).

```sql
SELECT COUNT(DISTINCT pt.TrackId) FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId=pt.PlaylistId WHERE p.Name='Music';
```

## C062

CÂU HỎI: Giá trị hóa đơn trung bình theo từng quốc gia (theo quốc gia thanh toán), chỉ tính các nước có ít nhất 20 hóa đơn.

```sql
SELECT BillingCountry, AVG(Total) AS avg_total FROM Invoice GROUP BY BillingCountry HAVING COUNT(*)>=20;
```

## C070

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName || ' ' || c.LastName AS customer_name, ROUND(SUM(i.Total), 2) AS total_spent FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId WHERE strftime('%Y', i.InvoiceDate) = '2024' GROUP BY c.CustomerId, c.FirstName, c.LastName ORDER BY total_spent DESC LIMIT 5;
```

## C010

CÂU HỎI: Những quốc gia nào có từ 5 khách hàng trở lên? Cho biết số khách hàng của từng nước.

```sql
SELECT Country, COUNT(*) AS customer_count FROM Customer WHERE Country IS NOT NULL GROUP BY Country HAVING COUNT(*) >= 5 ORDER BY customer_count DESC;
```

## C110

CÂU HỎI: 3 thể loại có thời lượng bài hát trung bình dài nhất, tính bằng phút (làm tròn 2 chữ số), từ dài đến ngắn.

```sql
SELECT g.Name, ROUND(AVG(t.Milliseconds) / 1000.0, 2) AS avg_minutes FROM Track t JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId ORDER BY AVG(t.Milliseconds) DESC LIMIT 3;
```

## C048

CÂU HỎI: Có bao nhiêu nghệ sĩ chưa từng bán được bài hát nào (tính cả nghệ sĩ không có album nào)?

```sql
-- Chỉ xét nghệ sĩ có album thì mới có bài hát để bán; nghệ sĩ không có album hiển nhiên
-- không bán được gì nên đã được bao hàm trong điều kiện NOT EXISTS. Kết quả an toàn.
SELECT COUNT(*) AS n_artists FROM Artist ar WHERE EXISTS (SELECT 1 FROM Album a2 WHERE a2.ArtistId = ar.ArtistId) AND NOT EXISTS ( SELECT 1 FROM Album al JOIN Track t ON t.AlbumId = al.AlbumId JOIN InvoiceLine il ON il.TrackId = t.TrackId WHERE al.ArtistId = ar.ArtistId );
```

## C001

CÂU HỎI: Playlist tên 'Grunge' có bao nhiêu bài hát?

```sql
SELECT COUNT(pt.TrackId) AS track_count FROM Playlist p JOIN PlaylistTrack pt ON pt.PlaylistId = p.PlaylistId WHERE p.Name = 'Grunge';
```

## C089

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name AS genre, ROUND(AVG(il.UnitPrice * il.Quantity), 2) AS revenue FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId ORDER BY revenue DESC LIMIT 5;
```

## C069

CÂU HỎI: Có bao nhiêu khách hàng ở Brazil?

```sql
SELECT COUNT(*) FROM Customer WHERE Country='Brazil';
```
