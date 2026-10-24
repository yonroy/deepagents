# Batch minitable_sonnet_r0_b7

## C085

CÂU HỎI: Giá trị hóa đơn trung bình theo từng quốc gia (theo quốc gia thanh toán), chỉ tính các nước có ít nhất 20 hóa đơn.

```sql
SELECT BillingCountry AS country, ROUND(AVG(Total), 2) AS avg_invoice_total FROM Invoice WHERE BillingCountry IS NOT NULL GROUP BY BillingCountry HAVING COUNT(*) >= 20 ORDER BY avg_invoice_total DESC;
```

## C068

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name, SUM(il.UnitPrice*il.Quantity) AS rev FROM InvoiceLine il JOIN Track t ON t.TrackId=il.TrackId JOIN Genre g ON g.GenreId=t.GenreId GROUP BY g.GenreId ORDER BY rev DESC LIMIT 5;
```

## C036

CÂU HỎI: Những bài hát nào nằm trong nhiều hơn 4 playlist khác nhau? Cho biết tên bài và số playlist.

```sql
SELECT t.Name AS TrackName, COUNT(DISTINCT pt.PlaylistId) AS PlaylistCount FROM Track t JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId GROUP BY t.TrackId, t.Name HAVING COUNT(DISTINCT pt.PlaylistId) > 4 ORDER BY PlaylistCount DESC;
```

## C051

CÂU HỎI: Với mỗi quốc gia, khách hàng nào chi tiêu nhiều nhất từ trước đến nay? Cho biết quốc gia, họ tên và tổng tiền (nếu hòa thì liệt kê tất cả).

```sql
WITH spend AS (SELECT c.Country, c.CustomerId, c.FirstName || ' ' || c.LastName AS full_name, SUM(i.Total) AS total FROM Customer c JOIN Invoice i ON i.CustomerId = c.CustomerId WHERE c.Country IS NOT NULL GROUP BY c.CustomerId, c.Country, c.FirstName, c.LastName), ranked AS (SELECT Country, full_name, total, RANK() OVER (PARTITION BY Country ORDER BY total DESC) AS rk FROM spend) SELECT Country, full_name, ROUND(total, 2) AS total_spent FROM ranked WHERE rk = 1;
```

## C004

CÂU HỎI: Tính tổng số bài hát khác nhau thuộc các playlist có tên 'Music' (lưu ý có thể có nhiều playlist trùng tên).

```sql
SELECT COUNT(pt.TrackId) AS n_tracks FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId WHERE p.Name = 'Music';
```

## C039

CÂU HỎI: 3 thể loại có thời lượng bài hát trung bình dài nhất, tính bằng phút (làm tròn 2 chữ số), từ dài đến ngắn.

```sql
SELECT g.Name AS Genre, ROUND(AVG(t.Milliseconds) / 60000.0, 2) AS AvgMinutes FROM Track t JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId, g.Name ORDER BY AvgMinutes DESC LIMIT 3;
```

## C045

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name AS ArtistName, COUNT(al.AlbumId) AS AlbumCount FROM Artist ar JOIN Album al ON al.ArtistId = ar.ArtistId GROUP BY ar.ArtistId, ar.Name HAVING COUNT(al.AlbumId) > 10 ORDER BY AlbumCount DESC;
```

## C070

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName || ' ' || c.LastName AS customer_name, ROUND(SUM(i.Total), 2) AS total_spent FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId WHERE strftime('%Y', i.InvoiceDate) = '2024' GROUP BY c.CustomerId, c.FirstName, c.LastName ORDER BY total_spent DESC LIMIT 5;
```

## C043

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title, COUNT(t.TrackId) AS n FROM Album al JOIN Artist ar ON ar.ArtistId=al.ArtistId LEFT JOIN Track t ON t.AlbumId=al.AlbumId WHERE ar.Name='Iron Maiden' GROUP BY al.AlbumId;
```

## C112

CÂU HỎI: 3 nghệ sĩ có doanh thu bán lẻ cao nhất từ khách hàng ở Đức (Germany) trong năm 2024, kèm doanh thu, từ cao xuống thấp.

```sql
SELECT ar.Name, ROUND(SUM(il.UnitPrice*il.Quantity),2) AS revenue FROM InvoiceLine il JOIN Invoice i ON i.InvoiceId=il.InvoiceId JOIN Customer c ON c.CustomerId=i.CustomerId JOIN Track t ON t.TrackId=il.TrackId JOIN Album al ON al.AlbumId=t.AlbumId JOIN Artist ar ON ar.ArtistId=al.ArtistId WHERE c.Country='Germany' AND i.InvoiceDate>='2024-01-01' AND i.InvoiceDate<'2025-01-01' GROUP BY ar.ArtistId ORDER BY revenue DESC LIMIT 3;
```
