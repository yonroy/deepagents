# Batch strict_sonnet_r0_b2

## C106

CÂU HỎI: Liệt kê họ tên mọi nhân viên kèm họ tên người quản lý trực tiếp; nhân viên không có quản lý thì cột quản lý để trống.

```sql
SELECT e.FirstName || ' ' || e.LastName AS employee_name, CASE WHEN m.EmployeeId IS NULL THEN NULL ELSE m.FirstName || ' ' || m.LastName END AS manager_name FROM Employee e LEFT JOIN Employee m ON m.EmployeeId = e.ReportsTo;
```

## C020

CÂU HỎI: Mỗi nhân viên phụ trách bao nhiêu khách hàng? Liệt kê tất cả nhân viên, kể cả người không phụ trách khách nào (khi đó ghi 0).

```sql
SELECT e.EmployeeId, e.FirstName || ' ' || e.LastName AS employee, COUNT(c.CustomerId) AS customer_count FROM Employee e LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId GROUP BY e.EmployeeId, e.FirstName, e.LastName ORDER BY customer_count DESC;
```

## C008

CÂU HỎI: Mỗi loại media có bao nhiêu bài hát đã từng được bán ít nhất một lần? (tên loại media, số bài)

```sql
SELECT m.Name, COUNT(DISTINCT t.TrackId) AS n FROM MediaType m JOIN Track t ON t.MediaTypeId=m.MediaTypeId JOIN InvoiceLine il ON il.TrackId=t.TrackId GROUP BY m.MediaTypeId;
```

## C096

CÂU HỎI: Tổng doanh thu (theo tổng tiền hóa đơn) của quý 1 năm 2025 (tháng 1 đến hết tháng 3) là bao nhiêu?

```sql
SELECT ROUND(SUM(Total), 2) AS revenue FROM Invoice WHERE InvoiceDate >= '2025-01-01' AND InvoiceDate <= '2025-03-31';
```

## C119

CÂU HỎI: Doanh thu năm 2023 (tổng tiền hóa đơn) mà mỗi nhân viên hỗ trợ mang lại thông qua các khách hàng họ phụ trách. Cho biết họ tên nhân viên và doanh thu.

```sql
-- JOIN thêm InvoiceLine để chắc chắn chỉ tính những hóa đơn thực sự có dòng hàng
-- (loại hóa đơn rỗng). SUM(i.Total) vẫn là tổng tiền hóa đơn nên doanh thu không đổi.
-- Cách viết này phổ biến trong các báo cáo doanh thu theo nhân viên.
SELECT e.FirstName, e.LastName, ROUND(SUM(i.Total), 2) AS revenue FROM Employee e JOIN Customer c ON c.SupportRepId = e.EmployeeId JOIN Invoice i ON i.CustomerId = c.CustomerId JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId WHERE i.InvoiceDate >= '2023-01-01' AND i.InvoiceDate < '2024-01-01' GROUP BY e.EmployeeId;
```

## C109

CÂU HỎI: Có bao nhiêu khách hàng đã mua ít nhất một bài thuộc thể loại 'Rock' VÀ ít nhất một bài thuộc thể loại 'Jazz'?

```sql
-- Lọc g.Name IN ('Rock', 'Jazz') đã bảo đảm khách mua cả hai thể loại;
-- HAVING chỉ để loại nhóm rỗng. Mỗi khách được đếm một lần nhờ GROUP BY CustomerId.
SELECT COUNT(*) AS n_customers FROM ( SELECT i.CustomerId FROM Invoice i JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId WHERE g.Name IN ('Rock', 'Jazz') GROUP BY i.CustomerId HAVING COUNT(DISTINCT g.Name) >= 1 );
```

## C122

CÂU HỎI: Có bao nhiêu album có tổng thời lượng trên 1 giờ VÀ có ít nhất một bài hát chưa có thông tin nhà soạn nhạc (Composer trống)?

```sql
SELECT COUNT(*) AS album_count FROM Album al WHERE (SELECT SUM(t.Milliseconds) FROM Track t WHERE t.AlbumId = al.AlbumId) > 3600000 AND EXISTS (SELECT 1 FROM Track t WHERE t.AlbumId = al.AlbumId AND (t.Composer IS NULL OR TRIM(t.Composer) = ''));
```

## C018

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) của từng tháng trong năm 2025, theo thứ tự tháng 1 đến 12.

```sql
SELECT strftime('%m', InvoiceDate) AS month, SUM(Total) AS revenue FROM Invoice WHERE InvoiceDate>='2025-01-01' AND InvoiceDate<'2026-01-01' GROUP BY month ORDER BY month;
```

## C105

CÂU HỎI: Những bài hát nào nằm trong nhiều hơn 4 playlist khác nhau? Cho biết tên bài và số playlist.

```sql
SELECT t.Name, COUNT(DISTINCT pt.PlaylistId) AS n_playlists FROM Track t JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId GROUP BY t.Name HAVING COUNT(DISTINCT pt.PlaylistId) > 4;
```

## C004

CÂU HỎI: Tính tổng số bài hát khác nhau thuộc các playlist có tên 'Music' (lưu ý có thể có nhiều playlist trùng tên).

```sql
SELECT COUNT(pt.TrackId) AS n_tracks FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId WHERE p.Name = 'Music';
```
