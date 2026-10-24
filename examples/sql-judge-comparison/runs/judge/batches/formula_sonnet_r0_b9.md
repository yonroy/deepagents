# Batch formula_sonnet_r0_b9

## C055

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName, c.LastName, ROUND(SUM(i.Total), 2) AS spent FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId GROUP BY c.CustomerId ORDER BY spent DESC LIMIT 5;
```

## C016

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title AS album, COUNT(t.TrackId) AS track_count FROM Album al JOIN Artist ar ON ar.ArtistId = al.ArtistId LEFT JOIN Track t ON t.AlbumId = al.AlbumId WHERE ar.Name = 'Iron Maiden' GROUP BY al.AlbumId, al.Title ORDER BY al.Title;
```

## C006

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) năm 2025 tăng hay giảm bao nhiêu phần trăm so với năm 2024? (làm tròn 2 chữ số, số âm nghĩa là giảm)

```sql
SELECT ROUND(100.0*(SUM(CASE WHEN InvoiceDate>='2025-01-01' AND InvoiceDate<'2026-01-01' THEN Total END)-SUM(CASE WHEN InvoiceDate>='2024-01-01' AND InvoiceDate<'2025-01-01' THEN Total END))/SUM(CASE WHEN InvoiceDate>='2024-01-01' AND InvoiceDate<'2025-01-01' THEN Total END),2) FROM Invoice;
```

## C081

CÂU HỎI: 3 nghệ sĩ có doanh thu bán lẻ cao nhất từ khách hàng ở Đức (Germany) trong năm 2024, kèm doanh thu, từ cao xuống thấp.

```sql
SELECT ar.Name, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue FROM InvoiceLine il JOIN Invoice i ON i.InvoiceId = il.InvoiceId JOIN Track t ON t.TrackId = il.TrackId JOIN Album al ON al.AlbumId = t.AlbumId JOIN Artist ar ON ar.ArtistId = al.ArtistId WHERE i.InvoiceDate >= '2024-01-01' AND i.InvoiceDate < '2025-01-01' GROUP BY ar.ArtistId ORDER BY revenue DESC LIMIT 3;
```

## C045

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name AS ArtistName, COUNT(al.AlbumId) AS AlbumCount FROM Artist ar JOIN Album al ON al.ArtistId = ar.ArtistId GROUP BY ar.ArtistId, ar.Name HAVING COUNT(al.AlbumId) > 10 ORDER BY AlbumCount DESC;
```

## C068

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name, SUM(il.UnitPrice*il.Quantity) AS rev FROM InvoiceLine il JOIN Track t ON t.TrackId=il.TrackId JOIN Genre g ON g.GenreId=t.GenreId GROUP BY g.GenreId ORDER BY rev DESC LIMIT 5;
```

## C093

CÂU HỎI: Tính tổng số bài hát khác nhau thuộc các playlist có tên 'Music' (lưu ý có thể có nhiều playlist trùng tên).

```sql
SELECT COUNT(DISTINCT pt.TrackId) AS distinct_track_count FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId WHERE p.Name = 'Music';
```

## C085

CÂU HỎI: Giá trị hóa đơn trung bình theo từng quốc gia (theo quốc gia thanh toán), chỉ tính các nước có ít nhất 20 hóa đơn.

```sql
SELECT BillingCountry AS country, ROUND(AVG(Total), 2) AS avg_invoice_total FROM Invoice WHERE BillingCountry IS NOT NULL GROUP BY BillingCountry HAVING COUNT(*) >= 20 ORDER BY avg_invoice_total DESC;
```

## C039

CÂU HỎI: 3 thể loại có thời lượng bài hát trung bình dài nhất, tính bằng phút (làm tròn 2 chữ số), từ dài đến ngắn.

```sql
SELECT g.Name AS Genre, ROUND(AVG(t.Milliseconds) / 60000.0, 2) AS AvgMinutes FROM Track t JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId, g.Name ORDER BY AvgMinutes DESC LIMIT 3;
```

## C066

CÂU HỎI: Liệt kê tên tất cả album của nghệ sĩ 'AC/DC'.

```sql
SELECT al.Title FROM Album al JOIN Artist ar ON al.ArtistId = ar.ArtistId WHERE ar.Name = 'AC/DC';
```
