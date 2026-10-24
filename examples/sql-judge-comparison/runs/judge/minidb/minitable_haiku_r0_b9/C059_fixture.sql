INSERT INTO Artist (ArtistId, Name) VALUES (1,'Prolific'),(2,'Tenner'),(3,'Dozen'),(4,'Twin'),(5,'Twin'),(6,'Few');
WITH RECURSIVE n(x) AS (SELECT 1 UNION ALL SELECT x+1 FROM n WHERE x < 11) INSERT INTO Album (AlbumId, Title, ArtistId) SELECT 100+x, 'P'||x, 1 FROM n;
WITH RECURSIVE n(x) AS (SELECT 1 UNION ALL SELECT x+1 FROM n WHERE x < 10) INSERT INTO Album (AlbumId, Title, ArtistId) SELECT 200+x, 'T'||x, 2 FROM n;
WITH RECURSIVE n(x) AS (SELECT 1 UNION ALL SELECT x+1 FROM n WHERE x < 12) INSERT INTO Album (AlbumId, Title, ArtistId) SELECT 300+x, 'D'||x, 3 FROM n;
WITH RECURSIVE n(x) AS (SELECT 1 UNION ALL SELECT x+1 FROM n WHERE x < 11) INSERT INTO Album (AlbumId, Title, ArtistId) SELECT 400+x, 'W'||x, 4 FROM n;
WITH RECURSIVE n(x) AS (SELECT 1 UNION ALL SELECT x+1 FROM n WHERE x < 11) INSERT INTO Album (AlbumId, Title, ArtistId) SELECT 500+x, 'V'||x, 5 FROM n;
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (601,'F1',6),(602,'F2',6),(603,'F3',6);
