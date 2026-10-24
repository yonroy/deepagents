# Batch formula_sonnet_r0_b10

## C043

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title, COUNT(t.TrackId) AS n FROM Album al JOIN Artist ar ON ar.ArtistId=al.ArtistId LEFT JOIN Track t ON t.AlbumId=al.AlbumId WHERE ar.Name='Iron Maiden' GROUP BY al.AlbumId;
```

## C070

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName || ' ' || c.LastName AS customer_name, ROUND(SUM(i.Total), 2) AS total_spent FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId WHERE strftime('%Y', i.InvoiceDate) = '2024' GROUP BY c.CustomerId, c.FirstName, c.LastName ORDER BY total_spent DESC LIMIT 5;
```

## C009

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name AS Genre, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS Revenue FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId, g.Name ORDER BY Revenue DESC LIMIT 5;
```

## C052

CÂU HỎI: Liệt kê tên tất cả album của nghệ sĩ 'AC/DC'.

```sql
SELECT al.Title FROM Album al JOIN Artist ar ON ar.ArtistId=al.ArtistId WHERE ar.Name='AC/DC';
```

## C069

CÂU HỎI: Có bao nhiêu khách hàng ở Brazil?

```sql
SELECT COUNT(*) FROM Customer WHERE Country='Brazil';
```

## C095

CÂU HỎI: Liệt kê họ, tên và ngày vào làm của các nhân viên có chức danh 'Sales Support Agent'.

```sql
SELECT LastName, FirstName, HireDate FROM Employee WHERE Title='Sales Support Agent';
```

## C054

CÂU HỎI: Giá bán trung bình của một bài hát thuộc loại media 'Protected AAC audio file' là bao nhiêu?

```sql
SELECT AVG(t.UnitPrice) AS avg_unit_price FROM Track t JOIN MediaType m ON t.MediaTypeId = m.MediaTypeId WHERE m.Name = 'Protected AAC audio file';
```

## C097

CÂU HỎI: Có bao nhiêu hóa đơn có tổng tiền từ 13.86 trở lên?

```sql
SELECT COUNT(*) AS n_invoices FROM Invoice WHERE Total > 13.86;
```

## C091

CÂU HỎI: Có bao nhiêu thể loại nhạc khác nhau đang có ít nhất một bài hát?

```sql
SELECT COUNT(GenreId) AS n_genres FROM Track;
```

## C107

CÂU HỎI: Liệt kê 10 bài hát dài nhất (tên bài và thời lượng tính bằng mili giây), từ dài đến ngắn.

```sql
SELECT Name, Milliseconds FROM Track ORDER BY Milliseconds ASC LIMIT 10;
```
