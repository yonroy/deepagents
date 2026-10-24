# Batch rubric_haiku_r1_b10

## C108

CÂU HỎI: Những quốc gia nào có từ 5 khách hàng trở lên? Cho biết số khách hàng của từng nước.

```sql
SELECT Country, COUNT(*) AS customer_count FROM Customer WHERE Country IS NOT NULL GROUP BY Country HAVING COUNT(*) >= 5;
```

## C093

CÂU HỎI: Tính tổng số bài hát khác nhau thuộc các playlist có tên 'Music' (lưu ý có thể có nhiều playlist trùng tên).

```sql
SELECT COUNT(DISTINCT pt.TrackId) AS distinct_track_count FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId WHERE p.Name = 'Music';
```

## C044

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name, COUNT(*) AS n_albums FROM Artist ar JOIN Album al ON al.ArtistId = ar.ArtistId JOIN Track t ON t.AlbumId = al.AlbumId GROUP BY ar.ArtistId HAVING COUNT(*) > 10;
```

## C091

CÂU HỎI: Có bao nhiêu thể loại nhạc khác nhau đang có ít nhất một bài hát?

```sql
SELECT COUNT(GenreId) AS n_genres FROM Track;
```

## C007

CÂU HỎI: Liệt kê họ, tên và ngày vào làm của các nhân viên có chức danh 'Sales Support Agent'.

```sql
SELECT LastName, FirstName, HireDate FROM Employee WHERE Title = 'Sales Support Agent';
```

## C066

CÂU HỎI: Liệt kê tên tất cả album của nghệ sĩ 'AC/DC'.

```sql
SELECT al.Title FROM Album al JOIN Artist ar ON al.ArtistId = ar.ArtistId WHERE ar.Name = 'AC/DC';
```

## C069

CÂU HỎI: Có bao nhiêu khách hàng ở Brazil?

```sql
SELECT COUNT(*) FROM Customer WHERE Country='Brazil';
```

## C084

CÂU HỎI: Có bao nhiêu hóa đơn có tổng tiền từ 13.86 trở lên?

```sql
SELECT COUNT(*) FROM Invoice WHERE Total >= 13.86;
```

## C061

CÂU HỎI: Giá bán trung bình của một bài hát thuộc loại media 'Protected AAC audio file' là bao nhiêu?

```sql
SELECT ROUND(AVG(t.UnitPrice), 2) AS avg_price FROM Track t JOIN MediaType m ON m.MediaTypeId = t.MediaTypeId;
```

## C086

CÂU HỎI: Liệt kê 10 bài hát dài nhất (tên bài và thời lượng tính bằng mili giây), từ dài đến ngắn.

```sql
SELECT Name, Milliseconds FROM Track ORDER BY Milliseconds DESC LIMIT 10;
```
