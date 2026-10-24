# Batch rubric_haiku_r1_b8

## C014

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title, COUNT(t.TrackId) AS n_tracks FROM Album al JOIN Artist ar ON ar.ArtistId = al.ArtistId JOIN Track t ON t.AlbumId = al.AlbumId WHERE ar.Name = 'Iron Maiden' GROUP BY ar.ArtistId;
```

## C013

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name AS genre, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId ORDER BY revenue ASC LIMIT 5;
```

## C003

CÂU HỎI: 3 nghệ sĩ có doanh thu bán lẻ cao nhất từ khách hàng ở Đức (Germany) trong năm 2024, kèm doanh thu, từ cao xuống thấp.

```sql
SELECT ar.Name AS artist_name, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue FROM InvoiceLine il JOIN Invoice i ON i.InvoiceId = il.InvoiceId JOIN Customer c ON c.CustomerId = i.CustomerId JOIN Track t ON t.TrackId = il.TrackId JOIN Album al ON al.AlbumId = t.AlbumId JOIN Artist ar ON ar.ArtistId = al.ArtistId WHERE c.Country = 'Germany' AND strftime('%Y', i.InvoiceDate) = '2024' GROUP BY ar.ArtistId, ar.Name ORDER BY revenue DESC LIMIT 3;
```

## C010

CÂU HỎI: Những quốc gia nào có từ 5 khách hàng trở lên? Cho biết số khách hàng của từng nước.

```sql
SELECT Country, COUNT(*) AS customer_count FROM Customer WHERE Country IS NOT NULL GROUP BY Country HAVING COUNT(*) >= 5 ORDER BY customer_count DESC;
```

## C062

CÂU HỎI: Giá trị hóa đơn trung bình theo từng quốc gia (theo quốc gia thanh toán), chỉ tính các nước có ít nhất 20 hóa đơn.

```sql
SELECT BillingCountry, AVG(Total) AS avg_total FROM Invoice GROUP BY BillingCountry HAVING COUNT(*)>=20;
```

## C105

CÂU HỎI: Những bài hát nào nằm trong nhiều hơn 4 playlist khác nhau? Cho biết tên bài và số playlist.

```sql
SELECT t.Name, COUNT(DISTINCT pt.PlaylistId) AS n_playlists FROM Track t JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId GROUP BY t.Name HAVING COUNT(DISTINCT pt.PlaylistId) > 4;
```

## C005

CÂU HỎI: Playlist tên 'Grunge' có bao nhiêu bài hát?

```sql
SELECT COUNT(*) AS n_tracks FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId;
```

## C055

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName, c.LastName, ROUND(SUM(i.Total), 2) AS spent FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId GROUP BY c.CustomerId ORDER BY spent DESC LIMIT 5;
```

## C041

CÂU HỎI: Doanh thu (tổng tiền hóa đơn) năm 2025 tăng hay giảm bao nhiêu phần trăm so với năm 2024? (làm tròn 2 chữ số, số âm nghĩa là giảm)

```sql
SELECT ROUND(100.0 * (SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2025' THEN Total END) - SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2024' THEN Total END)) / SUM(CASE WHEN strftime('%Y', InvoiceDate) = '2024' THEN Total END), 2) AS pct_change FROM Invoice WHERE strftime('%Y', InvoiceDate) IN ('2024', '2025');
```

## C045

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name AS ArtistName, COUNT(al.AlbumId) AS AlbumCount FROM Artist ar JOIN Album al ON al.ArtistId = ar.ArtistId GROUP BY ar.ArtistId, ar.Name HAVING COUNT(al.AlbumId) > 10 ORDER BY AlbumCount DESC;
```
