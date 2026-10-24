# Batch strict_haiku_r1_b8

## C034

CÂU HỎI: Những bài hát nào nằm trong nhiều hơn 4 playlist khác nhau? Cho biết tên bài và số playlist.

```sql
SELECT t.Name, COUNT(DISTINCT pt.PlaylistId) AS n FROM Track t JOIN PlaylistTrack pt ON pt.TrackId=t.TrackId GROUP BY t.TrackId HAVING n>4;
```

## C047

CÂU HỎI: Tỷ lệ phần trăm doanh thu bán lẻ của từng loại media trên tổng doanh thu (làm tròn 2 chữ số).

```sql
SELECT m.Name AS media_type, ROUND(100.0 * SUM(il.UnitPrice * il.Quantity) / (SELECT SUM(UnitPrice * Quantity) FROM InvoiceLine), 2) AS revenue_percent FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN MediaType m ON m.MediaTypeId = t.MediaTypeId GROUP BY m.MediaTypeId, m.Name ORDER BY revenue_percent DESC;
```

## C009

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name AS Genre, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS Revenue FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId, g.Name ORDER BY Revenue DESC LIMIT 5;
```

## C103

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName||' '||c.LastName AS name, SUM(i.Total) AS total FROM Invoice i JOIN Customer c ON c.CustomerId=i.CustomerId WHERE i.InvoiceDate>='2024-01-01' AND i.InvoiceDate<'2025-01-01' GROUP BY c.CustomerId ORDER BY total DESC LIMIT 5;
```

## C065

CÂU HỎI: Với mỗi quốc gia, khách hàng nào chi tiêu nhiều nhất từ trước đến nay? Cho biết quốc gia, họ tên và tổng tiền (nếu hòa thì liệt kê tất cả).

```sql
WITH spend AS (SELECT c.Country, c.CustomerId, c.FirstName || ' ' || c.LastName AS customer_name, SUM(i.Total) AS total FROM Customer c JOIN Invoice i ON i.CustomerId = c.CustomerId GROUP BY c.CustomerId, c.Country, c.FirstName, c.LastName), ranked AS (SELECT Country, customer_name, total, MAX(total) OVER (PARTITION BY Country) AS max_total FROM spend) SELECT Country, customer_name, ROUND(total, 2) AS total_spent FROM ranked WHERE total = max_total;
```

## C075

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) năm 2025 tăng hay giảm bao nhiêu phần trăm so với năm 2024? (làm tròn 2 chữ số, số âm nghĩa là giảm)

```sql
SELECT ROUND(100.0 * (SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2025' THEN Total ELSE 0 END) - SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2024' THEN Total ELSE 0 END)) / SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2024' THEN Total ELSE 0 END), 2) AS pct_change FROM Invoice;
```

## C031

CÂU HỎI: Playlist tên 'Grunge' có bao nhiêu bài hát?

```sql
SELECT COUNT(*) FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId=pt.PlaylistId WHERE p.Name='Grunge';
```

## C081

CÂU HỎI: 3 nghệ sĩ có doanh thu bán lẻ cao nhất từ khách hàng ở Đức (Germany) trong năm 2024, kèm doanh thu, từ cao xuống thấp.

```sql
SELECT ar.Name, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue FROM InvoiceLine il JOIN Invoice i ON i.InvoiceId = il.InvoiceId JOIN Track t ON t.TrackId = il.TrackId JOIN Album al ON al.AlbumId = t.AlbumId JOIN Artist ar ON ar.ArtistId = al.ArtistId WHERE i.InvoiceDate >= '2024-01-01' AND i.InvoiceDate < '2025-01-01' GROUP BY ar.ArtistId ORDER BY revenue DESC LIMIT 3;
```

## C033

CÂU HỎI: Tính tổng số bài hát khác nhau thuộc các playlist có tên 'Music' (lưu ý có thể có nhiều playlist trùng tên).

```sql
SELECT COUNT(DISTINCT pt.TrackId) FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId=pt.PlaylistId WHERE p.Name='Music';
```

## C010

CÂU HỎI: Những quốc gia nào có từ 5 khách hàng trở lên? Cho biết số khách hàng của từng nước.

```sql
SELECT Country, COUNT(*) AS customer_count FROM Customer WHERE Country IS NOT NULL GROUP BY Country HAVING COUNT(*) >= 5 ORDER BY customer_count DESC;
```
