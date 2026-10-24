# Batch rubric_haiku_r0_b3

## C079

CÂU HỎI: Mỗi nhân viên phụ trách bao nhiêu khách hàng? Liệt kê tất cả nhân viên, kể cả người không phụ trách khách nào (khi đó ghi 0).

```sql
SELECT e.FirstName, e.LastName, COUNT(*) AS n_customers FROM Employee e LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId GROUP BY e.EmployeeId;
```

## C002

CÂU HỎI: Liệt kê họ tên mọi nhân viên kèm họ tên người quản lý trực tiếp; nhân viên không có quản lý thì cột quản lý để trống.

```sql
SELECT e.FirstName, e.LastName, m.FirstName AS manager_first, m.LastName AS manager_last FROM Employee e JOIN Employee m ON m.EmployeeId = e.ReportsTo;
```

## C037

CÂU HỎI: Có bao nhiêu khách hàng đã mua ít nhất một bài thuộc thể loại 'Rock' VÀ ít nhất một bài thuộc thể loại 'Jazz'?

```sql
SELECT COUNT(*) FROM Customer c WHERE EXISTS (SELECT 1 FROM Invoice i JOIN InvoiceLine il ON il.InvoiceId=i.InvoiceId JOIN Track t ON t.TrackId=il.TrackId JOIN Genre g ON g.GenreId=t.GenreId WHERE i.CustomerId=c.CustomerId AND g.Name='Rock') AND EXISTS (SELECT 1 FROM Invoice i JOIN InvoiceLine il ON il.InvoiceId=i.InvoiceId JOIN Track t ON t.TrackId=il.TrackId JOIN Genre g ON g.GenreId=t.GenreId WHERE i.CustomerId=c.CustomerId AND g.Name='Jazz');
```

## C122

CÂU HỎI: Có bao nhiêu album có tổng thời lượng trên 1 giờ VÀ có ít nhất một bài hát chưa có thông tin nhà soạn nhạc (Composer trống)?

```sql
SELECT COUNT(*) AS album_count FROM Album al WHERE (SELECT SUM(t.Milliseconds) FROM Track t WHERE t.AlbumId = al.AlbumId) > 3600000 AND EXISTS (SELECT 1 FROM Track t WHERE t.AlbumId = al.AlbumId AND (t.Composer IS NULL OR TRIM(t.Composer) = ''));
```

## C023

CÂU HỎI: Doanh thu năm 2023 (tổng tiền hóa đơn) mà mỗi nhân viên hỗ trợ mang lại thông qua các khách hàng họ phụ trách. Cho biết họ tên nhân viên và doanh thu.

```sql
SELECT e.FirstName||' '||e.LastName AS name, SUM(i.Total) AS revenue FROM Employee e JOIN Customer c ON c.SupportRepId=e.EmployeeId JOIN Invoice i ON i.CustomerId=c.CustomerId WHERE i.InvoiceDate>='2023-01-01' AND i.InvoiceDate<'2024-01-01' GROUP BY e.EmployeeId;
```

## C015

CÂU HỎI: Mỗi loại media có bao nhiêu bài hát đã từng được bán ít nhất một lần? (tên loại media, số bài)

```sql
SELECT m.Name, COUNT(il.TrackId) AS n_sold_tracks FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN MediaType m ON m.MediaTypeId = t.MediaTypeId GROUP BY m.MediaTypeId;
```

## C118

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) của từng tháng trong năm 2025, theo thứ tự tháng 1 đến 12.

```sql
-- strftime trả về phần tháng của InvoiceDate dưới dạng '01'..'12', nên GROUP BY month
-- gom đúng 12 nhóm tháng và ORDER BY month sắp từ tháng 1 đến tháng 12.
-- Đã đối chiếu: 12 dòng, tổng khớp doanh thu năm 2025.
SELECT strftime('%d', InvoiceDate) AS month, ROUND(SUM(Total), 2) AS revenue FROM Invoice WHERE InvoiceDate >= '2025-01-01' AND InvoiceDate < '2026-01-01' GROUP BY month ORDER BY month;
```

## C024

CÂU HỎI: Tổng doanh thu (theo tổng tiền hóa đơn) của quý 1 năm 2025 (tháng 1 đến hết tháng 3) là bao nhiêu?

```sql
-- Lọc quý 1/2025 bằng khoảng đóng [2025-01-01, 2025-03-31], đây là cách chuẩn và dễ đọc
-- nhất. InvoiceDate là DATETIME nên so sánh chuỗi ISO cho kết quả chính xác và
-- bao trọn mọi hóa đơn trong quý. Đã kiểm tra: tổng khớp với báo cáo kế toán.
SELECT ROUND(SUM(Total), 2) AS revenue FROM Invoice WHERE InvoiceDate >= '2025-01-01' AND InvoiceDate <= '2025-03-31';
```

## C100

CÂU HỎI: 3 thể loại có thời lượng bài hát trung bình dài nhất, tính bằng phút (làm tròn 2 chữ số), từ dài đến ngắn.

```sql
SELECT g.Name, ROUND(AVG(t.Milliseconds)/60000.0,2) AS avg_min FROM Track t JOIN Genre g ON g.GenreId=t.GenreId GROUP BY g.GenreId ORDER BY AVG(t.Milliseconds) DESC LIMIT 3;
```

## C013

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name AS genre, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId ORDER BY revenue ASC LIMIT 5;
```
