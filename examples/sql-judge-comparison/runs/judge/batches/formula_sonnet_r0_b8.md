# Batch formula_sonnet_r0_b8

## C065

CÂU HỎI: Với mỗi quốc gia, khách hàng nào chi tiêu nhiều nhất từ trước đến nay? Cho biết quốc gia, họ tên và tổng tiền (nếu hòa thì liệt kê tất cả).

```sql
WITH spend AS (SELECT c.Country, c.CustomerId, c.FirstName || ' ' || c.LastName AS customer_name, SUM(i.Total) AS total FROM Customer c JOIN Invoice i ON i.CustomerId = c.CustomerId GROUP BY c.CustomerId, c.Country, c.FirstName, c.LastName), ranked AS (SELECT Country, customer_name, total, MAX(total) OVER (PARTITION BY Country) AS max_total FROM spend) SELECT Country, customer_name, ROUND(total, 2) AS total_spent FROM ranked WHERE total = max_total;
```

## C103

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName||' '||c.LastName AS name, SUM(i.Total) AS total FROM Invoice i JOIN Customer c ON c.CustomerId=i.CustomerId WHERE i.InvoiceDate>='2024-01-01' AND i.InvoiceDate<'2025-01-01' GROUP BY c.CustomerId ORDER BY total DESC LIMIT 5;
```

## C042

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title AS AlbumTitle, COUNT(t.TrackId) AS TrackCount FROM Album al JOIN Artist ar ON ar.ArtistId = al.ArtistId LEFT JOIN Track t ON t.AlbumId = al.AlbumId WHERE ar.Name = 'Iron Maiden' GROUP BY al.AlbumId, al.Title ORDER BY al.Title;
```

## C102

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) năm 2025 tăng hay giảm bao nhiêu phần trăm so với năm 2024? (làm tròn 2 chữ số, số âm nghĩa là giảm)

```sql
SELECT ROUND( 100.0 * (SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2025' THEN Total END) - SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2024' THEN Total END)) / SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2025' THEN Total END), 2) AS growth_pct FROM Invoice;
```

## C004

CÂU HỎI: Tính tổng số bài hát khác nhau thuộc các playlist có tên 'Music' (lưu ý có thể có nhiều playlist trùng tên).

```sql
SELECT COUNT(pt.TrackId) AS n_tracks FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId WHERE p.Name = 'Music';
```

## C048

CÂU HỎI: Có bao nhiêu nghệ sĩ chưa từng bán được bài hát nào (tính cả nghệ sĩ không có album nào)?

```sql
-- Chỉ xét nghệ sĩ có album thì mới có bài hát để bán; nghệ sĩ không có album hiển nhiên
-- không bán được gì nên đã được bao hàm trong điều kiện NOT EXISTS. Kết quả an toàn.
SELECT COUNT(*) AS n_artists FROM Artist ar WHERE EXISTS (SELECT 1 FROM Album a2 WHERE a2.ArtistId = ar.ArtistId) AND NOT EXISTS ( SELECT 1 FROM Album al JOIN Track t ON t.AlbumId = al.AlbumId JOIN InvoiceLine il ON il.TrackId = t.TrackId WHERE al.ArtistId = ar.ArtistId );
```

## C059

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name, COUNT(*) AS n FROM Artist ar JOIN Album al ON al.ArtistId=ar.ArtistId GROUP BY ar.ArtistId HAVING n>10;
```

## C034

CÂU HỎI: Những bài hát nào nằm trong nhiều hơn 4 playlist khác nhau? Cho biết tên bài và số playlist.

```sql
SELECT t.Name, COUNT(DISTINCT pt.PlaylistId) AS n FROM Track t JOIN PlaylistTrack pt ON pt.TrackId=t.TrackId GROUP BY t.TrackId HAVING n>4;
```

## C030

CÂU HỎI: 3 thể loại có thời lượng bài hát trung bình dài nhất, tính bằng phút (làm tròn 2 chữ số), từ dài đến ngắn.

```sql
SELECT g.Name AS genre, ROUND(AVG(t.Milliseconds) / 60000.0, 2) AS avg_minutes FROM Track t JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId, g.Name ORDER BY avg_minutes DESC LIMIT 3;
```

## C064

CÂU HỎI: Những quốc gia nào có từ 5 khách hàng trở lên? Cho biết số khách hàng của từng nước.

```sql
SELECT Country, COUNT(*) AS n_customers FROM Customer GROUP BY Country HAVING COUNT(*) > 5;
```
