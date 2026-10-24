# Batch minitable_sonnet_r0_b0

## C116

CÂU HỎI: Liệt kê họ tên mọi nhân viên kèm họ tên người quản lý trực tiếp; nhân viên không có quản lý thì cột quản lý để trống.

```sql
-- Self-join: ghép mỗi nhân viên e với quản lý m qua quan hệ ReportsTo. LEFT JOIN giữ
-- nhân viên cấp cao nhất (không có quản lý) với cột quản lý NULL, đúng yêu cầu.
SELECT e.FirstName, e.LastName, m.FirstName AS manager_first, m.LastName AS manager_last FROM Employee e LEFT JOIN Employee m ON m.ReportsTo = e.EmployeeId;
```

## C079

CÂU HỎI: Mỗi nhân viên phụ trách bao nhiêu khách hàng? Liệt kê tất cả nhân viên, kể cả người không phụ trách khách nào (khi đó ghi 0).

```sql
SELECT e.FirstName, e.LastName, COUNT(*) AS n_customers FROM Employee e LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId GROUP BY e.EmployeeId;
```

## C024

CÂU HỎI: Tổng doanh thu (theo tổng tiền hóa đơn) của quý 1 năm 2025 (tháng 1 đến hết tháng 3) là bao nhiêu?

```sql
-- Lọc quý 1/2025 bằng khoảng đóng [2025-01-01, 2025-03-31], đây là cách chuẩn và dễ đọc
-- nhất. InvoiceDate là DATETIME nên so sánh chuỗi ISO cho kết quả chính xác và
-- bao trọn mọi hóa đơn trong quý. Đã kiểm tra: tổng khớp với báo cáo kế toán.
SELECT ROUND(SUM(Total), 2) AS revenue FROM Invoice WHERE InvoiceDate >= '2025-01-01' AND InvoiceDate <= '2025-03-31';
```

## C077

CÂU HỎI: Có bao nhiêu album có tổng thời lượng trên 1 giờ VÀ có ít nhất một bài hát chưa có thông tin nhà soạn nhạc (Composer trống)?

```sql
SELECT COUNT(*) AS n_albums FROM ( SELECT AlbumId FROM Track GROUP BY AlbumId HAVING SUM(Milliseconds) > 3600000 AND SUM(CASE WHEN Composer = NULL THEN 1 ELSE 0 END) > 0 );
```

## C119

CÂU HỎI: Doanh thu năm 2023 (tổng tiền hóa đơn) mà mỗi nhân viên hỗ trợ mang lại thông qua các khách hàng họ phụ trách. Cho biết họ tên nhân viên và doanh thu.

```sql
-- JOIN thêm InvoiceLine để chắc chắn chỉ tính những hóa đơn thực sự có dòng hàng
-- (loại hóa đơn rỗng). SUM(i.Total) vẫn là tổng tiền hóa đơn nên doanh thu không đổi.
-- Cách viết này phổ biến trong các báo cáo doanh thu theo nhân viên.
SELECT e.FirstName, e.LastName, ROUND(SUM(i.Total), 2) AS revenue FROM Employee e JOIN Customer c ON c.SupportRepId = e.EmployeeId JOIN Invoice i ON i.CustomerId = c.CustomerId JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId WHERE i.InvoiceDate >= '2023-01-01' AND i.InvoiceDate < '2024-01-01' GROUP BY e.EmployeeId;
```

## C022

CÂU HỎI: Mỗi loại media có bao nhiêu bài hát đã từng được bán ít nhất một lần? (tên loại media, số bài)

```sql
SELECT mt.Name AS media_type, COUNT(DISTINCT t.TrackId) AS sold_track_count FROM MediaType mt JOIN Track t ON t.MediaTypeId = mt.MediaTypeId JOIN InvoiceLine il ON il.TrackId = t.TrackId GROUP BY mt.MediaTypeId, mt.Name ORDER BY sold_track_count DESC;
```

## C037

CÂU HỎI: Có bao nhiêu khách hàng đã mua ít nhất một bài thuộc thể loại 'Rock' VÀ ít nhất một bài thuộc thể loại 'Jazz'?

```sql
SELECT COUNT(*) FROM Customer c WHERE EXISTS (SELECT 1 FROM Invoice i JOIN InvoiceLine il ON il.InvoiceId=i.InvoiceId JOIN Track t ON t.TrackId=il.TrackId JOIN Genre g ON g.GenreId=t.GenreId WHERE i.CustomerId=c.CustomerId AND g.Name='Rock') AND EXISTS (SELECT 1 FROM Invoice i JOIN InvoiceLine il ON il.InvoiceId=i.InvoiceId JOIN Track t ON t.TrackId=il.TrackId JOIN Genre g ON g.GenreId=t.GenreId WHERE i.CustomerId=c.CustomerId AND g.Name='Jazz');
```

## C018

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) của từng tháng trong năm 2025, theo thứ tự tháng 1 đến 12.

```sql
SELECT strftime('%m', InvoiceDate) AS month, SUM(Total) AS revenue FROM Invoice WHERE InvoiceDate>='2025-01-01' AND InvoiceDate<'2026-01-01' GROUP BY month ORDER BY month;
```

## C013

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name AS genre, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId ORDER BY revenue ASC LIMIT 5;
```

## C090

CÂU HỎI: Có bao nhiêu nghệ sĩ chưa từng bán được bài hát nào (tính cả nghệ sĩ không có album nào)?

```sql
SELECT COUNT(*) AS n_artists FROM Artist ar WHERE EXISTS (SELECT 1 FROM Album a2 WHERE a2.ArtistId = ar.ArtistId) AND NOT EXISTS ( SELECT 1 FROM Album al JOIN Track t ON t.AlbumId = al.AlbumId JOIN InvoiceLine il ON il.TrackId = t.TrackId WHERE al.ArtistId = ar.ArtistId );
```
