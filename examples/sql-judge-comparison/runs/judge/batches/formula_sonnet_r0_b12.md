# Batch formula_sonnet_r0_b12

## C007

CÂU HỎI: Liệt kê họ, tên và ngày vào làm của các nhân viên có chức danh 'Sales Support Agent'.

```sql
SELECT LastName, FirstName, HireDate FROM Employee WHERE Title = 'Sales Support Agent';
```

## C083

CÂU HỎI: Giá bán trung bình của một bài hát thuộc loại media 'Protected AAC audio file' là bao nhiêu?

```sql
SELECT AVG(t.UnitPrice) FROM Track t JOIN MediaType m ON t.MediaTypeId=m.MediaTypeId WHERE m.Name='Protected AAC audio file';
```

## C058

CÂU HỎI: Có bao nhiêu thể loại nhạc khác nhau đang có ít nhất một bài hát?

```sql
SELECT COUNT(DISTINCT g.GenreId) AS genre_count FROM Genre g JOIN Track t ON t.GenreId = g.GenreId;
```

## C071

CÂU HỎI: Có bao nhiêu hóa đơn có tổng tiền từ 13.86 trở lên?

```sql
SELECT COUNT(*) AS invoice_count FROM Invoice WHERE Total >= 13.86;
```

## C087

CÂU HỎI: Có bao nhiêu khách hàng ở Brazil?

```sql
SELECT COUNT(*) AS n_customers FROM Customer WHERE Country = 'Brasil';
```
