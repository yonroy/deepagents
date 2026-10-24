# Batch formula_haiku_r1_b4

## C072

CÂU HỎI: Liệt kê họ tên mọi nhân viên kèm họ tên người quản lý trực tiếp; nhân viên không có quản lý thì cột quản lý để trống.

```sql
SELECT e.FirstName||' '||e.LastName AS employee, m.FirstName||' '||m.LastName AS manager FROM Employee e LEFT JOIN Employee m ON m.EmployeeId=e.ReportsTo;
```

## C099

CÂU HỎI: Mỗi nhân viên phụ trách bao nhiêu khách hàng? Liệt kê tất cả nhân viên, kể cả người không phụ trách khách nào (khi đó ghi 0).

```sql
SELECT e.EmployeeId, e.FirstName, e.LastName, COUNT(c.CustomerId) AS n FROM Employee e LEFT JOIN Customer c ON c.SupportRepId=e.EmployeeId GROUP BY e.EmployeeId;
```

## C114

CÂU HỎI: Có bao nhiêu album có tổng thời lượng trên 1 giờ VÀ có ít nhất một bài hát chưa có thông tin nhà soạn nhạc (Composer trống)?

```sql
-- Lọc trước các bài chưa có Composer bằng WHERE (hiệu quả hơn HAVING), sau đó nhóm theo
-- album và giữ album có tổng thời lượng trên 1 giờ. Hai điều kiện được thoả cùng lúc.
SELECT COUNT(*) AS n_albums FROM ( SELECT AlbumId FROM Track WHERE Composer IS NULL GROUP BY AlbumId HAVING SUM(Milliseconds) > 3600000 );
```

## C008

CÂU HỎI: Mỗi loại media có bao nhiêu bài hát đã từng được bán ít nhất một lần? (tên loại media, số bài)

```sql
SELECT m.Name, COUNT(DISTINCT t.TrackId) AS n FROM MediaType m JOIN Track t ON t.MediaTypeId=m.MediaTypeId JOIN InvoiceLine il ON il.TrackId=t.TrackId GROUP BY m.MediaTypeId;
```

## C073

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) của từng tháng trong năm 2025, theo thứ tự tháng 1 đến 12.

```sql
SELECT strftime('%m', InvoiceDate) AS month, ROUND(SUM(Total), 2) AS revenue FROM Invoice WHERE strftime('%Y', InvoiceDate) = '2025' GROUP BY strftime('%m', InvoiceDate) ORDER BY month;
```

## C011

CÂU HỎI: Tổng doanh thu (theo tổng tiền hóa đơn) của quý 1 năm 2025 (tháng 1 đến hết tháng 3) là bao nhiêu?

```sql
SELECT SUM(Total) FROM Invoice WHERE InvoiceDate >= '2025-01-01' AND InvoiceDate < '2025-04-01';
```

## C046

CÂU HỎI: Có bao nhiêu khách hàng đã mua ít nhất một bài thuộc thể loại 'Rock' VÀ ít nhất một bài thuộc thể loại 'Jazz'?

```sql
SELECT COUNT(*) AS customer_count FROM (SELECT i.CustomerId FROM Invoice i JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId WHERE g.Name = 'Rock' INTERSECT SELECT i.CustomerId FROM Invoice i JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId WHERE g.Name = 'Jazz');
```

## C050

CÂU HỎI: Doanh thu năm 2023 (tổng tiền hóa đơn) mà mỗi nhân viên hỗ trợ mang lại thông qua các khách hàng họ phụ trách. Cho biết họ tên nhân viên và doanh thu.

```sql
SELECT e.FirstName || ' ' || e.LastName AS employee_name, ROUND(COALESCE(SUM(i.Total), 0), 2) AS revenue FROM Employee e LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId LEFT JOIN Invoice i ON i.CustomerId = c.CustomerId AND strftime('%Y', i.InvoiceDate) = '2023' GROUP BY e.EmployeeId, e.FirstName, e.LastName;
```

## C062

CÂU HỎI: Giá trị hóa đơn trung bình theo từng quốc gia (theo quốc gia thanh toán), chỉ tính các nước có ít nhất 20 hóa đơn.

```sql
SELECT BillingCountry, AVG(Total) AS avg_total FROM Invoice GROUP BY BillingCountry HAVING COUNT(*)>=20;
```

## C044

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name, COUNT(*) AS n_albums FROM Artist ar JOIN Album al ON al.ArtistId = ar.ArtistId JOIN Track t ON t.AlbumId = al.AlbumId GROUP BY ar.ArtistId HAVING COUNT(*) > 10;
```
