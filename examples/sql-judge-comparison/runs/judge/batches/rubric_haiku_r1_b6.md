# Batch rubric_haiku_r1_b6

## C001

CÂU HỎI: Playlist tên 'Grunge' có bao nhiêu bài hát?

```sql
SELECT COUNT(pt.TrackId) AS track_count FROM Playlist p JOIN PlaylistTrack pt ON pt.PlaylistId = p.PlaylistId WHERE p.Name = 'Grunge';
```

## C030

CÂU HỎI: 3 thể loại có thời lượng bài hát trung bình dài nhất, tính bằng phút (làm tròn 2 chữ số), từ dài đến ngắn.

```sql
SELECT g.Name AS genre, ROUND(AVG(t.Milliseconds) / 60000.0, 2) AS avg_minutes FROM Track t JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId, g.Name ORDER BY avg_minutes DESC LIMIT 3;
```

## C059

CÂU HỎI: Những nghệ sĩ nào có nhiều hơn 10 album? Cho biết tên và số album.

```sql
SELECT ar.Name, COUNT(*) AS n FROM Artist ar JOIN Album al ON al.ArtistId=ar.ArtistId GROUP BY ar.ArtistId HAVING n>10;
```

## C103

CÂU HỎI: 5 khách hàng chi tiêu nhiều nhất trong năm 2024 (họ tên và tổng tiền), từ cao xuống thấp (không cần đúng thứ tự giữa các khách hòa tiền).

```sql
SELECT c.FirstName||' '||c.LastName AS name, SUM(i.Total) AS total FROM Invoice i JOIN Customer c ON c.CustomerId=i.CustomerId WHERE i.InvoiceDate>='2024-01-01' AND i.InvoiceDate<'2025-01-01' GROUP BY c.CustomerId ORDER BY total DESC LIMIT 5;
```

## C028

CÂU HỎI: Tỷ lệ phần trăm doanh thu bán lẻ của từng loại media trên tổng doanh thu (làm tròn 2 chữ số).

```sql
SELECT m.Name, ROUND(100 * CAST(SUM(il.UnitPrice * il.Quantity) AS INTEGER) / CAST((SELECT SUM(UnitPrice * Quantity) FROM InvoiceLine) AS INTEGER), 2) AS pct FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN MediaType m ON m.MediaTypeId = t.MediaTypeId GROUP BY m.MediaTypeId;
```

## C090

CÂU HỎI: Có bao nhiêu nghệ sĩ chưa từng bán được bài hát nào (tính cả nghệ sĩ không có album nào)?

```sql
SELECT COUNT(*) AS n_artists FROM Artist ar WHERE EXISTS (SELECT 1 FROM Album a2 WHERE a2.ArtistId = ar.ArtistId) AND NOT EXISTS ( SELECT 1 FROM Album al JOIN Track t ON t.AlbumId = al.AlbumId JOIN InvoiceLine il ON il.TrackId = t.TrackId WHERE al.ArtistId = ar.ArtistId );
```

## C111

CÂU HỎI: Với mỗi quốc gia, khách hàng nào chi tiêu nhiều nhất từ trước đến nay? Cho biết quốc gia, họ tên và tổng tiền (nếu hòa thì liệt kê tất cả).

```sql
WITH s AS (SELECT c.CustomerId, c.Country, c.FirstName||' '||c.LastName AS name, SUM(i.Total) AS total FROM Customer c JOIN Invoice i ON i.CustomerId=c.CustomerId GROUP BY c.CustomerId) SELECT Country, name, total FROM s WHERE total=(SELECT MAX(total) FROM s s2 WHERE s2.Country=s.Country) ORDER BY Country;
```

## C034

CÂU HỎI: Những bài hát nào nằm trong nhiều hơn 4 playlist khác nhau? Cho biết tên bài và số playlist.

```sql
SELECT t.Name, COUNT(DISTINCT pt.PlaylistId) AS n FROM Track t JOIN PlaylistTrack pt ON pt.TrackId=t.TrackId GROUP BY t.TrackId HAVING n>4;
```

## C042

CÂU HỎI: Mỗi album của nghệ sĩ 'Iron Maiden' có bao nhiêu bài hát? (tên album, số bài)

```sql
SELECT al.Title AS AlbumTitle, COUNT(t.TrackId) AS TrackCount FROM Album al JOIN Artist ar ON ar.ArtistId = al.ArtistId LEFT JOIN Track t ON t.AlbumId = al.AlbumId WHERE ar.Name = 'Iron Maiden' GROUP BY al.AlbumId, al.Title ORDER BY al.Title;
```

## C009

CÂU HỎI: 5 thể loại nhạc có doanh thu bán lẻ cao nhất (doanh thu = đơn giá × số lượng trên từng dòng hóa đơn), kèm doanh thu, từ cao xuống thấp.

```sql
SELECT g.Name AS Genre, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS Revenue FROM InvoiceLine il JOIN Track t ON t.TrackId = il.TrackId JOIN Genre g ON g.GenreId = t.GenreId GROUP BY g.GenreId, g.Name ORDER BY Revenue DESC LIMIT 5;
```
