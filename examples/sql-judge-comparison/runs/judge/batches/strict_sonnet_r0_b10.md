# Batch strict_sonnet_r0_b10

## C076

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName || ' ' || c.LastName AS CustomerName, ROUND(SUM(i.Total), 2) AS TotalSpent FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId WHERE i.InvoiceDate >= '2024-01-01' AND i.InvoiceDate < '2025-01-01' GROUP BY c.CustomerId, c.FirstName, c.LastName ORDER BY TotalSpent DESC LIMIT 5;
```

## C059

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name, COUNT(*) AS n FROM Artist ar JOIN Album al ON al.ArtistId=ar.ArtistId GROUP BY ar.ArtistId HAVING n>10;
```

## C080

CÂU HỎI: Có bao nhiêu khách hàng ở Brazil?

```sql
SELECT COUNT(*) AS customer_count FROM Customer WHERE Country = 'Brazil';
```

## C078

CÂU HỎI: Có bao nhiêu thể loại nhạc khác nhau đang có ít nhất một bài hát?

```sql
SELECT COUNT(DISTINCT GenreId) FROM Track WHERE GenreId IS NOT NULL;
```

## C054

CÂU HỎI: Giá bán trung bình của một bài hát thuộc loại media 'Protected AAC audio file' là bao nhiêu?

```sql
SELECT AVG(t.UnitPrice) AS avg_unit_price FROM Track t JOIN MediaType m ON t.MediaTypeId = m.MediaTypeId WHERE m.Name = 'Protected AAC audio file';
```

## C007

CÂU HỎI: Liệt kê họ, tên và ngày vào làm của các nhân viên có chức danh 'Sales Support Agent'.

```sql
SELECT LastName, FirstName, HireDate FROM Employee WHERE Title = 'Sales Support Agent';
```

## C097

CÂU HỎI: Có bao nhiêu hóa đơn có tổng tiền từ 13.86 trở lên?

```sql
SELECT COUNT(*) AS n_invoices FROM Invoice WHERE Total > 13.86;
```

## C052

CÂU HỎI: Liệt kê tên tất cả album của nghệ sĩ 'AC/DC'.

```sql
SELECT al.Title FROM Album al JOIN Artist ar ON ar.ArtistId=al.ArtistId WHERE ar.Name='AC/DC';
```

## C086

CÂU HỎI: Liệt kê 10 bài hát dài nhất (tên bài và thời lượng tính bằng mili giây), từ dài đến ngắn.

```sql
SELECT Name, Milliseconds FROM Track ORDER BY Milliseconds DESC LIMIT 10;
```
