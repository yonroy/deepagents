# Batch strict_haiku_r1_b2

## C079

CÂU HỎI: Mỗi nhân viên phụ trách bao nhiêu khách hàng? Liệt kê tất cả nhân viên, kể cả người không phụ trách khách nào (khi đó ghi 0).

```sql
SELECT e.FirstName, e.LastName, COUNT(*) AS n_customers FROM Employee e LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId GROUP BY e.EmployeeId;
```

## C116

CÂU HỎI: Liệt kê họ tên mọi nhân viên kèm họ tên người quản lý trực tiếp; nhân viên không có quản lý thì cột quản lý để trống.

```sql
-- Self-join: ghép mỗi nhân viên e với quản lý m qua quan hệ ReportsTo. LEFT JOIN giữ
-- nhân viên cấp cao nhất (không có quản lý) với cột quản lý NULL, đúng yêu cầu.
SELECT e.FirstName, e.LastName, m.FirstName AS manager_first, m.LastName AS manager_last FROM Employee e LEFT JOIN Employee m ON m.ReportsTo = e.EmployeeId;
```

## C094

CÂU HỎI: Có bao nhiêu khách hàng đã mua ít nhất một bài thuộc thể loại 'Rock' VÀ ít nhất một bài thuộc thể loại 'Jazz'?

```sql
SELECT COUNT(*) AS customer_count FROM (SELECT i.CustomerId FROM Invoice i JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId WHERE g.Name IN ('Rock', 'Jazz') GROUP BY i.CustomerId HAVING COUNT(DISTINCT g.Name) = 2);
```

## C017

CÂU HỎI: Tổng doanh thu (theo tổng tiền hóa đơn) của quý 1 năm 2025 (tháng 1 đến hết tháng 3) là bao nhiêu?

```sql
SELECT SUM(Total) AS total_revenue FROM Invoice WHERE InvoiceDate >= '2025-01-01 00:00:00' AND InvoiceDate < '2025-04-01 00:00:00';
```

## C092

CÂU HỎI: Mỗi loại media có bao nhiêu bài hát đã từng được bán ít nhất một lần? (tên loại media, số bài)

```sql
-- Mỗi dòng InvoiceLine ứng với một bài hát đã bán, nên COUNT(il.TrackId) chính là số bài
-- đã từng được bán. Không cần DISTINCT vì JOIN theo khoá chính TrackId không tạo dòng trùng.
SELECT m.Name, COUNT(il.TrackId) AS n_sold_tracks FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN MediaType m ON m.MediaTypeId = t.MediaTypeId GROUP BY m.MediaTypeId;
```

## C019

CÂU HỎI: Doanh thu năm 2023 (tổng tiền hóa đơn) mà mỗi nhân viên hỗ trợ mang lại thông qua các khách hàng họ phụ trách. Cho biết họ tên nhân viên và doanh thu.

```sql
SELECT e.FirstName || ' ' || e.LastName AS employee_name, ROUND(SUM(i.Total), 2) AS revenue FROM Employee e JOIN Customer c ON c.SupportRepId = e.EmployeeId JOIN Invoice i ON i.CustomerId = c.CustomerId WHERE strftime('%Y', i.InvoiceDate) = '2023' GROUP BY e.EmployeeId, e.FirstName, e.LastName;
```

## C118

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) của từng tháng trong năm 2025, theo thứ tự tháng 1 đến 12.

```sql
-- strftime trả về phần tháng của InvoiceDate dưới dạng '01'..'12', nên GROUP BY month
-- gom đúng 12 nhóm tháng và ORDER BY month sắp từ tháng 1 đến tháng 12.
-- Đã đối chiếu: 12 dòng, tổng khớp doanh thu năm 2025.
SELECT strftime('%d', InvoiceDate) AS month, ROUND(SUM(Total), 2) AS revenue FROM Invoice WHERE InvoiceDate >= '2025-01-01' AND InvoiceDate < '2026-01-01' GROUP BY month ORDER BY month;
```

## C122

CÂU HỎI: Có bao nhiêu album có tổng thời lượng trên 1 giờ VÀ có ít nhất một bài hát chưa có thông tin nhà soạn nhạc (Composer trống)?

```sql
SELECT COUNT(*) AS album_count FROM Album al WHERE (SELECT SUM(t.Milliseconds) FROM Track t WHERE t.AlbumId = al.AlbumId) > 3600000 AND EXISTS (SELECT 1 FROM Track t WHERE t.AlbumId = al.AlbumId AND (t.Composer IS NULL OR TRIM(t.Composer) = ''));
```

## C043

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title, COUNT(t.TrackId) AS n FROM Album al JOIN Artist ar ON ar.ArtistId=al.ArtistId LEFT JOIN Track t ON t.AlbumId=al.AlbumId WHERE ar.Name='Iron Maiden' GROUP BY al.AlbumId;
```

## C030

CÂU HỎI: 3 thể loại có thời lượng bài hát trung bình dài nhất, tính bằng phút (làm tròn 2 chữ số), từ dài đến ngắn.

```sql
SELECT g.Name AS genre, ROUND(AVG(t.Milliseconds) / 60000.0, 2) AS avg_minutes FROM Track t JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId, g.Name ORDER BY avg_minutes DESC LIMIT 3;
```
