# Batch strict_sonnet_r0_b5

## C032

CÂU HỎI: Mỗi nhân viên phụ trách bao nhiêu khách hàng? Liệt kê tất cả nhân viên, kể cả người không phụ trách khách nào (khi đó ghi 0).

```sql
-- LEFT JOIN để giữ cả nhân viên không phụ trách khách nào, đúng yêu cầu đề bài.
-- COUNT(*) đếm số dòng của mỗi nhóm sau khi JOIN, tức là số khách mỗi nhân viên phụ trách.
-- Nhân viên không có khách sẽ ra 0 như yêu cầu.
SELECT e.FirstName, e.LastName, COUNT(*) AS n_customers FROM Employee e LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId GROUP BY e.EmployeeId;
```

## C104

CÂU HỎI: Liệt kê họ tên mọi nhân viên kèm họ tên người quản lý trực tiếp; nhân viên không có quản lý thì cột quản lý để trống.

```sql
SELECT e.FirstName, e.LastName, m.FirstName AS manager_first, m.LastName AS manager_last FROM Employee e LEFT JOIN Employee m ON m.ReportsTo = e.EmployeeId;
```

## C049

CÂU HỎI: 3 nghệ sĩ có doanh thu bán lẻ cao nhất từ khách hàng ở Đức (Germany) trong năm 2024, kèm doanh thu, từ cao xuống thấp.

```sql
SELECT ar.Name AS artist_name, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue FROM Customer c JOIN Invoice i ON i.CustomerId = c.CustomerId JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId JOIN Track t ON t.TrackId = il.TrackId JOIN Album al ON al.AlbumId = t.AlbumId JOIN Artist ar ON ar.ArtistId = al.ArtistId WHERE c.Country = 'Germany' AND strftime('%Y', i.InvoiceDate) = '2024' GROUP BY ar.ArtistId, ar.Name ORDER BY revenue DESC LIMIT 3;
```

## C051

CÂU HỎI: Với mỗi quốc gia, khách hàng nào chi tiêu nhiều nhất từ trước đến nay? Cho biết quốc gia, họ tên và tổng tiền (nếu hòa thì liệt kê tất cả).

```sql
WITH spend AS (SELECT c.Country, c.CustomerId, c.FirstName || ' ' || c.LastName AS full_name, SUM(i.Total) AS total FROM Customer c JOIN Invoice i ON i.CustomerId = c.CustomerId WHERE c.Country IS NOT NULL GROUP BY c.CustomerId, c.Country, c.FirstName, c.LastName), ranked AS (SELECT Country, full_name, total, RANK() OVER (PARTITION BY Country ORDER BY total DESC) AS rk FROM spend) SELECT Country, full_name, ROUND(total, 2) AS total_spent FROM ranked WHERE rk = 1;
```

## C006

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) năm 2025 tăng hay giảm bao nhiêu phần trăm so với năm 2024? (làm tròn 2 chữ số, số âm nghĩa là giảm)

```sql
SELECT ROUND(100.0*(SUM(CASE WHEN InvoiceDate>='2025-01-01' AND InvoiceDate<'2026-01-01' THEN Total END)-SUM(CASE WHEN InvoiceDate>='2024-01-01' AND InvoiceDate<'2025-01-01' THEN Total END))/SUM(CASE WHEN InvoiceDate>='2024-01-01' AND InvoiceDate<'2025-01-01' THEN Total END),2) FROM Invoice;
```

## C045

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name AS ArtistName, COUNT(al.AlbumId) AS AlbumCount FROM Artist ar JOIN Album al ON al.ArtistId = ar.ArtistId GROUP BY ar.ArtistId, ar.Name HAVING COUNT(al.AlbumId) > 10 ORDER BY AlbumCount DESC;
```

## C098

CÂU HỎI: Những bài hát nào nằm trong nhiều hơn 4 playlist khác nhau? Cho biết tên bài và số playlist.

```sql
SELECT t.Name AS track, COUNT(DISTINCT pt.PlaylistId) AS playlist_count FROM PlaylistTrack pt JOIN Track t ON t.TrackId = pt.TrackId GROUP BY t.TrackId, t.Name HAVING COUNT(DISTINCT pt.PlaylistId) > 4 ORDER BY playlist_count DESC;
```

## C014

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title, COUNT(t.TrackId) AS n_tracks FROM Album al JOIN Artist ar ON ar.ArtistId = al.ArtistId JOIN Track t ON t.AlbumId = al.AlbumId WHERE ar.Name = 'Iron Maiden' GROUP BY ar.ArtistId;
```

## C001

CÂU HỎI: Playlist tên 'Grunge' có bao nhiêu bài hát?

```sql
SELECT COUNT(pt.TrackId) AS track_count FROM Playlist p JOIN PlaylistTrack pt ON pt.PlaylistId = p.PlaylistId WHERE p.Name = 'Grunge';
```

## C010

CÂU HỎI: Những quốc gia nào có từ 5 khách hàng trở lên? Cho biết số khách hàng của từng nước.

```sql
SELECT Country, COUNT(*) AS customer_count FROM Customer WHERE Country IS NOT NULL GROUP BY Country HAVING COUNT(*) >= 5 ORDER BY customer_count DESC;
```
