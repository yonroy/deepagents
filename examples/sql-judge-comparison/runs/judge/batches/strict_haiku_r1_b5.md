# Batch strict_haiku_r1_b5

## C020

CÂU HỎI: Mỗi nhân viên phụ trách bao nhiêu khách hàng? Liệt kê tất cả nhân viên, kể cả người không phụ trách khách nào (khi đó ghi 0).

```sql
SELECT e.EmployeeId, e.FirstName || ' ' || e.LastName AS employee, COUNT(c.CustomerId) AS customer_count FROM Employee e LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId GROUP BY e.EmployeeId, e.FirstName, e.LastName ORDER BY customer_count DESC;
```

## C072

CÂU HỎI: Liệt kê họ tên mọi nhân viên kèm họ tên người quản lý trực tiếp; nhân viên không có quản lý thì cột quản lý để trống.

```sql
SELECT e.FirstName||' '||e.LastName AS employee, m.FirstName||' '||m.LastName AS manager FROM Employee e LEFT JOIN Employee m ON m.EmployeeId=e.ReportsTo;
```

## C006

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) năm 2025 tăng hay giảm bao nhiêu phần trăm so với năm 2024? (làm tròn 2 chữ số, số âm nghĩa là giảm)

```sql
SELECT ROUND(100.0*(SUM(CASE WHEN InvoiceDate>='2025-01-01' AND InvoiceDate<'2026-01-01' THEN Total END)-SUM(CASE WHEN InvoiceDate>='2024-01-01' AND InvoiceDate<'2025-01-01' THEN Total END))/SUM(CASE WHEN InvoiceDate>='2024-01-01' AND InvoiceDate<'2025-01-01' THEN Total END),2) FROM Invoice;
```

## C016

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title AS album, COUNT(t.TrackId) AS track_count FROM Album al JOIN Artist ar ON ar.ArtistId = al.ArtistId LEFT JOIN Track t ON t.AlbumId = al.AlbumId WHERE ar.Name = 'Iron Maiden' GROUP BY al.AlbumId, al.Title ORDER BY al.Title;
```

## C055

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName, c.LastName, ROUND(SUM(i.Total), 2) AS spent FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId GROUP BY c.CustomerId ORDER BY spent DESC LIMIT 5;
```

## C098

CÂU HỎI: Những bài hát nào nằm trong nhiều hơn 4 playlist khác nhau? Cho biết tên bài và số playlist.

```sql
SELECT t.Name AS track, COUNT(DISTINCT pt.PlaylistId) AS playlist_count FROM PlaylistTrack pt JOIN Track t ON t.TrackId = pt.TrackId GROUP BY t.TrackId, t.Name HAVING COUNT(DISTINCT pt.PlaylistId) > 4 ORDER BY playlist_count DESC;
```

## C048

CÂU HỎI: Có bao nhiêu nghệ sĩ chưa từng bán được bài hát nào (tính cả nghệ sĩ không có album nào)?

```sql
-- Chỉ xét nghệ sĩ có album thì mới có bài hát để bán; nghệ sĩ không có album hiển nhiên
-- không bán được gì nên đã được bao hàm trong điều kiện NOT EXISTS. Kết quả an toàn.
SELECT COUNT(*) AS n_artists FROM Artist ar WHERE EXISTS (SELECT 1 FROM Album a2 WHERE a2.ArtistId = ar.ArtistId) AND NOT EXISTS ( SELECT 1 FROM Album al JOIN Track t ON t.AlbumId = al.AlbumId JOIN InvoiceLine il ON il.TrackId = t.TrackId WHERE al.ArtistId = ar.ArtistId );
```

## C085

CÂU HỎI: Giá trị hóa đơn trung bình theo từng quốc gia (theo quốc gia thanh toán), chỉ tính các nước có ít nhất 20 hóa đơn.

```sql
SELECT BillingCountry AS country, ROUND(AVG(Total), 2) AS avg_invoice_total FROM Invoice WHERE BillingCountry IS NOT NULL GROUP BY BillingCountry HAVING COUNT(*) >= 20 ORDER BY avg_invoice_total DESC;
```

## C005

CÂU HỎI: Playlist tên 'Grunge' có bao nhiêu bài hát?

```sql
SELECT COUNT(*) AS n_tracks FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId;
```

## C108

CÂU HỎI: Những quốc gia nào có từ 5 khách hàng trở lên? Cho biết số khách hàng của từng nước.

```sql
SELECT Country, COUNT(*) AS customer_count FROM Customer WHERE Country IS NOT NULL GROUP BY Country HAVING COUNT(*) >= 5;
```
