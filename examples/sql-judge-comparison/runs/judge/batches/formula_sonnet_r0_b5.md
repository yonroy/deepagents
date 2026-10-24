# Batch formula_sonnet_r0_b5

## C099

CÂU HỎI: Mỗi nhân viên phụ trách bao nhiêu khách hàng? Liệt kê tất cả nhân viên, kể cả người không phụ trách khách nào (khi đó ghi 0).

```sql
SELECT e.EmployeeId, e.FirstName, e.LastName, COUNT(c.CustomerId) AS n FROM Employee e LEFT JOIN Customer c ON c.SupportRepId=e.EmployeeId GROUP BY e.EmployeeId;
```

## C072

CÂU HỎI: Liệt kê họ tên mọi nhân viên kèm họ tên người quản lý trực tiếp; nhân viên không có quản lý thì cột quản lý để trống.

```sql
SELECT e.FirstName||' '||e.LastName AS employee, m.FirstName||' '||m.LastName AS manager FROM Employee e LEFT JOIN Employee m ON m.EmployeeId=e.ReportsTo;
```

## C053

CÂU HỎI: Có bao nhiêu nghệ sĩ chưa từng bán được bài hát nào (tính cả nghệ sĩ không có album nào)?

```sql
SELECT COUNT(*) AS artist_count FROM Artist ar WHERE NOT EXISTS (SELECT 1 FROM Album al JOIN Track t ON t.AlbumId = al.AlbumId JOIN InvoiceLine il ON il.TrackId = t.TrackId WHERE al.ArtistId = ar.ArtistId);
```

## C111

CÂU HỎI: Với mỗi quốc gia, khách hàng nào chi tiêu nhiều nhất từ trước đến nay? Cho biết quốc gia, họ tên và tổng tiền (nếu hòa thì liệt kê tất cả).

```sql
WITH s AS (SELECT c.CustomerId, c.Country, c.FirstName||' '||c.LastName AS name, SUM(i.Total) AS total FROM Customer c JOIN Invoice i ON i.CustomerId=c.CustomerId GROUP BY c.CustomerId) SELECT Country, name, total FROM s WHERE total=(SELECT MAX(total) FROM s s2 WHERE s2.Country=s.Country) ORDER BY Country;
```

## C063

CÂU HỎI: Giá trị hóa đơn trung bình theo từng quốc gia (theo quốc gia thanh toán), chỉ tính các nước có ít nhất 20 hóa đơn.

```sql
SELECT BillingCountry AS Country, ROUND(AVG(Total), 2) AS AvgInvoiceValue, COUNT(*) AS InvoiceCount FROM Invoice GROUP BY BillingCountry HAVING COUNT(*) >= 20 ORDER BY AvgInvoiceValue DESC;
```

## C112

CÂU HỎI: 3 nghệ sĩ có doanh thu bán lẻ cao nhất từ khách hàng ở Đức (Germany) trong năm 2024, kèm doanh thu, từ cao xuống thấp.

```sql
SELECT ar.Name, ROUND(SUM(il.UnitPrice*il.Quantity),2) AS revenue FROM InvoiceLine il JOIN Invoice i ON i.InvoiceId=il.InvoiceId JOIN Customer c ON c.CustomerId=i.CustomerId JOIN Track t ON t.TrackId=il.TrackId JOIN Album al ON al.AlbumId=t.AlbumId JOIN Artist ar ON ar.ArtistId=al.ArtistId WHERE c.Country='Germany' AND i.InvoiceDate>='2024-01-01' AND i.InvoiceDate<'2025-01-01' GROUP BY ar.ArtistId ORDER BY revenue DESC LIMIT 3;
```

## C120

CÂU HỎI: Tính tổng số bài hát khác nhau thuộc các playlist có tên 'Music' (lưu ý có thể có nhiều playlist trùng tên).

```sql
SELECT COUNT(DISTINCT pt.TrackId) AS distinct_track_count FROM Playlist p JOIN PlaylistTrack pt ON pt.PlaylistId = p.PlaylistId WHERE p.Name = 'Music';
```

## C105

CÂU HỎI: Những bài hát nào nằm trong nhiều hơn 4 playlist khác nhau? Cho biết tên bài và số playlist.

```sql
SELECT t.Name, COUNT(DISTINCT pt.PlaylistId) AS n_playlists FROM Track t JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId GROUP BY t.Name HAVING COUNT(DISTINCT pt.PlaylistId) > 4;
```

## C031

CÂU HỎI: Playlist tên 'Grunge' có bao nhiêu bài hát?

```sql
SELECT COUNT(*) FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId=pt.PlaylistId WHERE p.Name='Grunge';
```

## C044

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name, COUNT(*) AS n_albums FROM Artist ar JOIN Album al ON al.ArtistId = ar.ArtistId JOIN Track t ON t.AlbumId = al.AlbumId GROUP BY ar.ArtistId HAVING COUNT(*) > 10;
```
