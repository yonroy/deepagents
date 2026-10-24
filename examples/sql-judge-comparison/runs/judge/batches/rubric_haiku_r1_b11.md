# Batch rubric_haiku_r1_b11

## C040

CÂU HỎI: Liệt kê tên tất cả album của nghệ sĩ 'AC/DC'.

```sql
SELECT al.Title FROM Album al JOIN Artist ar ON ar.ArtistId = al.AlbumId WHERE ar.Name = 'AC/DC';
```

## C078

CÂU HỎI: Có bao nhiêu thể loại nhạc khác nhau đang có ít nhất một bài hát?

```sql
SELECT COUNT(DISTINCT GenreId) FROM Track WHERE GenreId IS NOT NULL;
```

## C056

CÂU HỎI: Liệt kê họ, tên và ngày vào làm của các nhân viên có chức danh 'Sales Support Agent'.

```sql
SELECT LastName, FirstName, BirthDate FROM Employee WHERE Title = 'Sales Support Agent';
```

## C083

CÂU HỎI: Giá bán trung bình của một bài hát thuộc loại media 'Protected AAC audio file' là bao nhiêu?

```sql
SELECT AVG(t.UnitPrice) FROM Track t JOIN MediaType m ON t.MediaTypeId=m.MediaTypeId WHERE m.Name='Protected AAC audio file';
```

## C087

CÂU HỎI: Có bao nhiêu khách hàng ở Brazil?

```sql
SELECT COUNT(*) AS n_customers FROM Customer WHERE Country = 'Brasil';
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
