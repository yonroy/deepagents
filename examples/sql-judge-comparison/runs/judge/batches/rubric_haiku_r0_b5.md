# Batch rubric_haiku_r0_b5

## C104

CÂU HỎI: Liệt kê họ tên mọi nhân viên kèm họ tên người quản lý trực tiếp; nhân viên không có quản lý thì cột quản lý để trống.

```sql
SELECT e.FirstName, e.LastName, m.FirstName AS manager_first, m.LastName AS manager_last FROM Employee e LEFT JOIN Employee m ON m.ReportsTo = e.EmployeeId;
```

## C032

CÂU HỎI: Mỗi nhân viên phụ trách bao nhiêu khách hàng? Liệt kê tất cả nhân viên, kể cả người không phụ trách khách nào (khi đó ghi 0).

```sql
-- LEFT JOIN để giữ cả nhân viên không phụ trách khách nào, đúng yêu cầu đề bài.
-- COUNT(*) đếm số dòng của mỗi nhóm sau khi JOIN, tức là số khách mỗi nhân viên phụ trách.
-- Nhân viên không có khách sẽ ra 0 như yêu cầu.
SELECT e.FirstName, e.LastName, COUNT(*) AS n_customers FROM Employee e LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId GROUP BY e.EmployeeId;
```

## C102

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) năm 2025 tăng hay giảm bao nhiêu phần trăm so với năm 2024? (làm tròn 2 chữ số, số âm nghĩa là giảm)

```sql
SELECT ROUND( 100.0 * (SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2025' THEN Total END) - SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2024' THEN Total END)) / SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2025' THEN Total END), 2) AS growth_pct FROM Invoice;
```

## C009

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name AS Genre, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS Revenue FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId, g.Name ORDER BY Revenue DESC LIMIT 5;
```

## C049

CÂU HỎI: 3 nghệ sĩ có doanh thu bán lẻ cao nhất từ khách hàng ở Đức (Germany) trong năm 2024, kèm doanh thu, từ cao xuống thấp.

```sql
SELECT ar.Name AS artist_name, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue FROM Customer c JOIN Invoice i ON i.CustomerId = c.CustomerId JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId JOIN Track t ON t.TrackId = il.TrackId JOIN Album al ON al.AlbumId = t.AlbumId JOIN Artist ar ON ar.ArtistId = al.ArtistId WHERE c.Country = 'Germany' AND strftime('%Y', i.InvoiceDate) = '2024' GROUP BY ar.ArtistId, ar.Name ORDER BY revenue DESC LIMIT 3;
```

## C113

CÂU HỎI: Tỷ lệ phần trăm doanh thu bán lẻ của từng loại media trên tổng doanh thu (làm tròn 2 chữ số).

```sql
SELECT mt.Name AS media_type, ROUND(100.0 * SUM(il.UnitPrice * il.Quantity) / (SELECT SUM(UnitPrice * Quantity) FROM InvoiceLine), 2) AS revenue_percent FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN MediaType mt ON mt.MediaTypeId = t.MediaTypeId GROUP BY mt.MediaTypeId, mt.Name;
```

## C065

CÂU HỎI: Với mỗi quốc gia, khách hàng nào chi tiêu nhiều nhất từ trước đến nay? Cho biết quốc gia, họ tên và tổng tiền (nếu hòa thì liệt kê tất cả).

```sql
WITH spend AS (SELECT c.Country, c.CustomerId, c.FirstName || ' ' || c.LastName AS customer_name, SUM(i.Total) AS total FROM Customer c JOIN Invoice i ON i.CustomerId = c.CustomerId GROUP BY c.CustomerId, c.Country, c.FirstName, c.LastName), ranked AS (SELECT Country, customer_name, total, MAX(total) OVER (PARTITION BY Country) AS max_total FROM spend) SELECT Country, customer_name, ROUND(total, 2) AS total_spent FROM ranked WHERE total = max_total;
```

## C034

CÂU HỎI: Những bài hát nào nằm trong nhiều hơn 4 playlist khác nhau? Cho biết tên bài và số playlist.

```sql
SELECT t.Name, COUNT(DISTINCT pt.PlaylistId) AS n FROM Track t JOIN PlaylistTrack pt ON pt.TrackId=t.TrackId GROUP BY t.TrackId HAVING n>4;
```

## C005

CÂU HỎI: Playlist tên 'Grunge' có bao nhiêu bài hát?

```sql
SELECT COUNT(*) AS n_tracks FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId;
```

## C082

CÂU HỎI: Những quốc gia nào có từ 5 khách hàng trở lên? Cho biết số khách hàng của từng nước.

```sql
SELECT Country, COUNT(*) AS n FROM Customer GROUP BY Country HAVING COUNT(*) >= 5 ORDER BY n DESC;
```
