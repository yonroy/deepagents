# Batch rubric_haiku_r0_b10

## C004

CÂU HỎI: Tính tổng số bài hát khác nhau thuộc các playlist có tên 'Music' (lưu ý có thể có nhiều playlist trùng tên).

```sql
SELECT COUNT(pt.TrackId) AS n_tracks FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId WHERE p.Name = 'Music';
```

## C014

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title, COUNT(t.TrackId) AS n_tracks FROM Album al JOIN Artist ar ON ar.ArtistId = al.ArtistId JOIN Track t ON t.AlbumId = al.AlbumId WHERE ar.Name = 'Iron Maiden' GROUP BY ar.ArtistId;
```

## C055

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName, c.LastName, ROUND(SUM(i.Total), 2) AS spent FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId GROUP BY c.CustomerId ORDER BY spent DESC LIMIT 5;
```

## C052

CÂU HỎI: Liệt kê tên tất cả album của nghệ sĩ 'AC/DC'.

```sql
SELECT al.Title FROM Album al JOIN Artist ar ON ar.ArtistId=al.ArtistId WHERE ar.Name='AC/DC';
```

## C058

CÂU HỎI: Có bao nhiêu thể loại nhạc khác nhau đang có ít nhất một bài hát?

```sql
SELECT COUNT(DISTINCT g.GenreId) AS genre_count FROM Genre g JOIN Track t ON t.GenreId = g.GenreId;
```

## C080

CÂU HỎI: Có bao nhiêu khách hàng ở Brazil?

```sql
SELECT COUNT(*) AS customer_count FROM Customer WHERE Country = 'Brazil';
```

## C083

CÂU HỎI: Giá bán trung bình của một bài hát thuộc loại media 'Protected AAC audio file' là bao nhiêu?

```sql
SELECT AVG(t.UnitPrice) FROM Track t JOIN MediaType m ON t.MediaTypeId=m.MediaTypeId WHERE m.Name='Protected AAC audio file';
```

## C056

CÂU HỎI: Liệt kê họ, tên và ngày vào làm của các nhân viên có chức danh 'Sales Support Agent'.

```sql
SELECT LastName, FirstName, BirthDate FROM Employee WHERE Title = 'Sales Support Agent';
```

## C097

CÂU HỎI: Có bao nhiêu hóa đơn có tổng tiền từ 13.86 trở lên?

```sql
SELECT COUNT(*) AS n_invoices FROM Invoice WHERE Total > 13.86;
```

## C107

CÂU HỎI: Liệt kê 10 bài hát dài nhất (tên bài và thời lượng tính bằng mili giây), từ dài đến ngắn.

```sql
SELECT Name, Milliseconds FROM Track ORDER BY Milliseconds ASC LIMIT 10;
```
