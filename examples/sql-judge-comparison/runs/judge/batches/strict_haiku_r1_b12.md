# Batch strict_haiku_r1_b12

## C056

CÂU HỎI: Liệt kê họ, tên và ngày vào làm của các nhân viên có chức danh 'Sales Support Agent'.

```sql
SELECT LastName, FirstName, BirthDate FROM Employee WHERE Title = 'Sales Support Agent';
```

## C054

CÂU HỎI: Giá bán trung bình của một bài hát thuộc loại media 'Protected AAC audio file' là bao nhiêu?

```sql
SELECT AVG(t.UnitPrice) AS avg_unit_price FROM Track t JOIN MediaType m ON t.MediaTypeId = m.MediaTypeId WHERE m.Name = 'Protected AAC audio file';
```

## C040

CÂU HỎI: Liệt kê tên tất cả album của nghệ sĩ 'AC/DC'.

```sql
SELECT al.Title FROM Album al JOIN Artist ar ON ar.ArtistId = al.AlbumId WHERE ar.Name = 'AC/DC';
```

## C080

CÂU HỎI: Có bao nhiêu khách hàng ở Brazil?

```sql
SELECT COUNT(*) AS customer_count FROM Customer WHERE Country = 'Brazil';
```

## C071

CÂU HỎI: Có bao nhiêu hóa đơn có tổng tiền từ 13.86 trở lên?

```sql
SELECT COUNT(*) AS invoice_count FROM Invoice WHERE Total >= 13.86;
```

## C058

CÂU HỎI: Có bao nhiêu thể loại nhạc khác nhau đang có ít nhất một bài hát?

```sql
SELECT COUNT(DISTINCT g.GenreId) AS genre_count FROM Genre g JOIN Track t ON t.GenreId = g.GenreId;
```
