# Batch rubric_haiku_r0_b2

## C067

CÂU HỎI: Liệt kê họ tên mọi nhân viên kèm họ tên người quản lý trực tiếp; nhân viên không có quản lý thì cột quản lý để trống.

```sql
SELECT e.FirstName || ' ' || e.LastName AS employee_name, m.FirstName || ' ' || m.LastName AS manager_name FROM Employee e LEFT JOIN Employee m ON m.EmployeeId = e.ReportsTo;
```

## C020

CÂU HỎI: Mỗi nhân viên phụ trách bao nhiêu khách hàng? Liệt kê tất cả nhân viên, kể cả người không phụ trách khách nào (khi đó ghi 0).

```sql
SELECT e.EmployeeId, e.FirstName || ' ' || e.LastName AS employee, COUNT(c.CustomerId) AS customer_count FROM Employee e LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId GROUP BY e.EmployeeId, e.FirstName, e.LastName ORDER BY customer_count DESC;
```

## C114

CÂU HỎI: Có bao nhiêu album có tổng thời lượng trên 1 giờ VÀ có ít nhất một bài hát chưa có thông tin nhà soạn nhạc (Composer trống)?

```sql
-- Lọc trước các bài chưa có Composer bằng WHERE (hiệu quả hơn HAVING), sau đó nhóm theo
-- album và giữ album có tổng thời lượng trên 1 giờ. Hai điều kiện được thoả cùng lúc.
SELECT COUNT(*) AS n_albums FROM ( SELECT AlbumId FROM Track WHERE Composer IS NULL GROUP BY AlbumId HAVING SUM(Milliseconds) > 3600000 );
```

## C109

CÂU HỎI: Có bao nhiêu khách hàng đã mua ít nhất một bài thuộc thể loại 'Rock' VÀ ít nhất một bài thuộc thể loại 'Jazz'?

```sql
-- Lọc g.Name IN ('Rock', 'Jazz') đã bảo đảm khách mua cả hai thể loại;
-- HAVING chỉ để loại nhóm rỗng. Mỗi khách được đếm một lần nhờ GROUP BY CustomerId.
SELECT COUNT(*) AS n_customers FROM ( SELECT i.CustomerId FROM Invoice i JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId WHERE g.Name IN ('Rock', 'Jazz') GROUP BY i.CustomerId HAVING COUNT(DISTINCT g.Name) >= 1 );
```

## C029

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) của từng tháng trong năm 2025, theo thứ tự tháng 1 đến 12.

```sql
SELECT strftime('%m', InvoiceDate) AS Month, ROUND(SUM(Total), 2) AS Revenue FROM Invoice WHERE InvoiceDate >= '2025-01-01' AND InvoiceDate < '2026-01-01' GROUP BY strftime('%m', InvoiceDate) ORDER BY Month;
```

## C117

CÂU HỎI: Tổng doanh thu (theo tổng tiền hóa đơn) của quý 1 năm 2025 (tháng 1 đến hết tháng 3) là bao nhiêu?

```sql
SELECT SUM(Total) AS total_revenue FROM Invoice WHERE InvoiceDate >= '2025-01-01' AND InvoiceDate < '2025-04-01';
```

## C060

CÂU HỎI: Mỗi loại media có bao nhiêu bài hát đã từng được bán ít nhất một lần? (tên loại media, số bài)

```sql
SELECT mt.Name AS MediaType, COUNT(DISTINCT t.TrackId) AS TrackCount FROM MediaType mt JOIN Track t ON t.MediaTypeId = mt.MediaTypeId JOIN InvoiceLine il ON il.TrackId = t.TrackId GROUP BY mt.MediaTypeId, mt.Name ORDER BY TrackCount DESC;
```

## C025

CÂU HỎI: Doanh thu năm 2023 (tổng tiền hóa đơn) mà mỗi nhân viên hỗ trợ mang lại thông qua các khách hàng họ phụ trách. Cho biết họ tên nhân viên và doanh thu.

```sql
SELECT e.FirstName, e.LastName, ROUND(SUM(i.Total), 2) AS revenue FROM Employee e JOIN Customer c ON c.SupportRepId = e.EmployeeId JOIN Invoice i ON i.CustomerId = c.CustomerId JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId WHERE i.InvoiceDate >= '2023-01-01' AND i.InvoiceDate < '2024-01-01' GROUP BY e.EmployeeId;
```

## C051

CÂU HỎI: Với mỗi quốc gia, khách hàng nào chi tiêu nhiều nhất từ trước đến nay? Cho biết quốc gia, họ tên và tổng tiền (nếu hòa thì liệt kê tất cả).

```sql
WITH spend AS (SELECT c.Country, c.CustomerId, c.FirstName || ' ' || c.LastName AS full_name, SUM(i.Total) AS total FROM Customer c JOIN Invoice i ON i.CustomerId = c.CustomerId WHERE c.Country IS NOT NULL GROUP BY c.CustomerId, c.Country, c.FirstName, c.LastName), ranked AS (SELECT Country, full_name, total, RANK() OVER (PARTITION BY Country ORDER BY total DESC) AS rk FROM spend) SELECT Country, full_name, ROUND(total, 2) AS total_spent FROM ranked WHERE rk = 1;
```

## C039

CÂU HỎI: 3 thể loại có thời lượng bài hát trung bình dài nhất, tính bằng phút (làm tròn 2 chữ số), từ dài đến ngắn.

```sql
SELECT g.Name AS Genre, ROUND(AVG(t.Milliseconds) / 60000.0, 2) AS AvgMinutes FROM Track t JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId, g.Name ORDER BY AvgMinutes DESC LIMIT 3;
```
