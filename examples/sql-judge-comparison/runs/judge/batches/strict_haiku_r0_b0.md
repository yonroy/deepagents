# Batch strict_haiku_r0_b0

## C116

CÂU HỎI: Liệt kê họ tên mọi nhân viên kèm họ tên người quản lý trực tiếp; nhân viên không có quản lý thì cột quản lý để trống.

```sql
-- Self-join: ghép mỗi nhân viên e với quản lý m qua quan hệ ReportsTo. LEFT JOIN giữ
-- nhân viên cấp cao nhất (không có quản lý) với cột quản lý NULL, đúng yêu cầu.
SELECT e.FirstName, e.LastName, m.FirstName AS manager_first, m.LastName AS manager_last FROM Employee e LEFT JOIN Employee m ON m.ReportsTo = e.EmployeeId;
```

## C038

CÂU HỎI: Mỗi nhân viên phụ trách bao nhiêu khách hàng? Liệt kê tất cả nhân viên, kể cả người không phụ trách khách nào (khi đó ghi 0).

```sql
SELECT e.FirstName, e.LastName, COUNT(c.CustomerId) AS n_customers FROM Employee e JOIN Customer c ON c.SupportRepId = e.EmployeeId GROUP BY e.EmployeeId;
```

## C109

CÂU HỎI: Có bao nhiêu khách hàng đã mua ít nhất một bài thuộc thể loại 'Rock' VÀ ít nhất một bài thuộc thể loại 'Jazz'?

```sql
-- Lọc g.Name IN ('Rock', 'Jazz') đã bảo đảm khách mua cả hai thể loại;
-- HAVING chỉ để loại nhóm rỗng. Mỗi khách được đếm một lần nhờ GROUP BY CustomerId.
SELECT COUNT(*) AS n_customers FROM ( SELECT i.CustomerId FROM Invoice i JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId WHERE g.Name IN ('Rock', 'Jazz') GROUP BY i.CustomerId HAVING COUNT(DISTINCT g.Name) >= 1 );
```

## C018

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) của từng tháng trong năm 2025, theo thứ tự tháng 1 đến 12.

```sql
SELECT strftime('%m', InvoiceDate) AS month, SUM(Total) AS revenue FROM Invoice WHERE InvoiceDate>='2025-01-01' AND InvoiceDate<'2026-01-01' GROUP BY month ORDER BY month;
```

## C017

CÂU HỎI: Tổng doanh thu (theo tổng tiền hóa đơn) của quý 1 năm 2025 (tháng 1 đến hết tháng 3) là bao nhiêu?

```sql
SELECT SUM(Total) AS total_revenue FROM Invoice WHERE InvoiceDate >= '2025-01-01 00:00:00' AND InvoiceDate < '2025-04-01 00:00:00';
```

## C025

CÂU HỎI: Doanh thu năm 2023 (tổng tiền hóa đơn) mà mỗi nhân viên hỗ trợ mang lại thông qua các khách hàng họ phụ trách. Cho biết họ tên nhân viên và doanh thu.

```sql
SELECT e.FirstName, e.LastName, ROUND(SUM(i.Total), 2) AS revenue FROM Employee e JOIN Customer c ON c.SupportRepId = e.EmployeeId JOIN Invoice i ON i.CustomerId = c.CustomerId JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId WHERE i.InvoiceDate >= '2023-01-01' AND i.InvoiceDate < '2024-01-01' GROUP BY e.EmployeeId;
```

## C114

CÂU HỎI: Có bao nhiêu album có tổng thời lượng trên 1 giờ VÀ có ít nhất một bài hát chưa có thông tin nhà soạn nhạc (Composer trống)?

```sql
-- Lọc trước các bài chưa có Composer bằng WHERE (hiệu quả hơn HAVING), sau đó nhóm theo
-- album và giữ album có tổng thời lượng trên 1 giờ. Hai điều kiện được thoả cùng lúc.
SELECT COUNT(*) AS n_albums FROM ( SELECT AlbumId FROM Track WHERE Composer IS NULL GROUP BY AlbumId HAVING SUM(Milliseconds) > 3600000 );
```

## C015

CÂU HỎI: Mỗi loại media có bao nhiêu bài hát đã từng được bán ít nhất một lần? (tên loại media, số bài)

```sql
SELECT m.Name, COUNT(il.TrackId) AS n_sold_tracks FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN MediaType m ON m.MediaTypeId = t.MediaTypeId GROUP BY m.MediaTypeId;
```

## C041

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) năm 2025 tăng hay giảm bao nhiêu phần trăm so với năm 2024? (làm tròn 2 chữ số, số âm nghĩa là giảm)

```sql
SELECT ROUND(100.0 * (SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2025' THEN Total END) - SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2024' THEN Total END)) / SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2024' THEN Total END), 2) AS pct_change FROM Invoice WHERE strftime('%Y', InvoiceDate) IN ('2024', '2025');
```

## C076

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName || ' ' || c.LastName AS CustomerName, ROUND(SUM(i.Total), 2) AS TotalSpent FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId WHERE i.InvoiceDate >= '2024-01-01' AND i.InvoiceDate < '2025-01-01' GROUP BY c.CustomerId, c.FirstName, c.LastName ORDER BY TotalSpent DESC LIMIT 5;
```
