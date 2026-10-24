# Batch formula_haiku_r1_b12

## C066

CÂU HỎI: Liệt kê tên tất cả album của nghệ sĩ 'AC/DC'.

```sql
SELECT al.Title FROM Album al JOIN Artist ar ON al.ArtistId = ar.ArtistId WHERE ar.Name = 'AC/DC';
```

## C058

CÂU HỎI: Có bao nhiêu thể loại nhạc khác nhau đang có ít nhất một bài hát?

```sql
SELECT COUNT(DISTINCT g.GenreId) AS genre_count FROM Genre g JOIN Track t ON t.GenreId = g.GenreId;
```

## C084

CÂU HỎI: Có bao nhiêu hóa đơn có tổng tiền từ 13.86 trở lên?

```sql
SELECT COUNT(*) FROM Invoice WHERE Total >= 13.86;
```

## C069

CÂU HỎI: Có bao nhiêu khách hàng ở Brazil?

```sql
SELECT COUNT(*) FROM Customer WHERE Country='Brazil';
```

## C095

CÂU HỎI: Liệt kê họ, tên và ngày vào làm của các nhân viên có chức danh 'Sales Support Agent'.

```sql
SELECT LastName, FirstName, HireDate FROM Employee WHERE Title='Sales Support Agent';
```
