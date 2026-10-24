# Batch minitable_haiku_r0_b8

## C039

CÂU HỎI: 3 thể loại có thời lượng bài hát trung bình dài nhất, tính bằng phút (làm tròn 2 chữ số), từ dài đến ngắn.

```sql
SELECT g.Name AS Genre, ROUND(AVG(t.Milliseconds) / 60000.0, 2) AS AvgMinutes FROM Track t JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId, g.Name ORDER BY AvgMinutes DESC LIMIT 3;
```

## C115

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name AS artist, COUNT(al.AlbumId) AS album_count FROM Artist ar JOIN Album al ON al.ArtistId = ar.ArtistId GROUP BY ar.ArtistId, ar.Name HAVING COUNT(al.AlbumId) > 10 ORDER BY album_count DESC;
```

## C074

CÂU HỎI: Tỷ lệ phần trăm doanh thu bán lẻ của từng loại media trên tổng doanh thu (làm tròn 2 chữ số).

```sql
SELECT m.Name, ROUND(100.0*SUM(il.UnitPrice*il.Quantity)/(SELECT SUM(UnitPrice*Quantity) FROM InvoiceLine),2) AS pct FROM InvoiceLine il JOIN Track t ON t.TrackId=il.TrackId JOIN MediaType m ON m.MediaTypeId=t.MediaTypeId GROUP BY m.MediaTypeId;
```

## C053

CÂU HỎI: Có bao nhiêu nghệ sĩ chưa từng bán được bài hát nào (tính cả nghệ sĩ không có album nào)?

```sql
SELECT COUNT(*) AS artist_count FROM Artist ar WHERE NOT EXISTS (SELECT 1 FROM Album al JOIN Track t ON t.AlbumId = al.AlbumId JOIN InvoiceLine il ON il.TrackId = t.TrackId WHERE al.ArtistId = ar.ArtistId);
```

## C043

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title, COUNT(t.TrackId) AS n FROM Album al JOIN Artist ar ON ar.ArtistId=al.ArtistId LEFT JOIN Track t ON t.AlbumId=al.AlbumId WHERE ar.Name='Iron Maiden' GROUP BY al.AlbumId;
```

## C082

CÂU HỎI: Những quốc gia nào có từ 5 khách hàng trở lên? Cho biết số khách hàng của từng nước.

```sql
SELECT Country, COUNT(*) AS n FROM Customer GROUP BY Country HAVING COUNT(*) >= 5 ORDER BY n DESC;
```

## C081

CÂU HỎI: 3 nghệ sĩ có doanh thu bán lẻ cao nhất từ khách hàng ở Đức (Germany) trong năm 2024, kèm doanh thu, từ cao xuống thấp.

```sql
SELECT ar.Name, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue FROM InvoiceLine il JOIN Invoice i ON i.InvoiceId = il.InvoiceId JOIN Track t ON t.TrackId = il.TrackId JOIN Album al ON al.AlbumId = t.AlbumId JOIN Artist ar ON ar.ArtistId = al.ArtistId WHERE i.InvoiceDate >= '2024-01-01' AND i.InvoiceDate < '2025-01-01' GROUP BY ar.ArtistId ORDER BY revenue DESC LIMIT 3;
```

## C068

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name, SUM(il.UnitPrice*il.Quantity) AS rev FROM InvoiceLine il JOIN Track t ON t.TrackId=il.TrackId JOIN Genre g ON g.GenreId=t.GenreId GROUP BY g.GenreId ORDER BY rev DESC LIMIT 5;
```

## C076

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName || ' ' || c.LastName AS CustomerName, ROUND(SUM(i.Total), 2) AS TotalSpent FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId WHERE i.InvoiceDate >= '2024-01-01' AND i.InvoiceDate < '2025-01-01' GROUP BY c.CustomerId, c.FirstName, c.LastName ORDER BY TotalSpent DESC LIMIT 5;
```

## C027

CÂU HỎI: Giá trị hóa đơn trung bình theo từng quốc gia (theo quốc gia thanh toán), chỉ tính các nước có ít nhất 20 hóa đơn.

```sql
SELECT BillingCountry, ROUND(AVG(Total), 2) AS avg_total FROM Invoice GROUP BY BillingCountry HAVING SUM(Total) >= 20;
```
