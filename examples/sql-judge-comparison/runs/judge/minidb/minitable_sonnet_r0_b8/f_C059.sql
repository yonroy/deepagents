INSERT INTO Artist (ArtistId, Name) VALUES (1,'Eleven'),(2,'Ten'),(3,'Twelve'),(4,'None'),(5,'Dup'),(6,'Dup');
INSERT INTO Album (AlbumId, Title, ArtistId) WITH RECURSIVE n(x) AS (SELECT 1 UNION ALL SELECT x+1 FROM n WHERE x<11) SELECT x, 'a', 1 FROM n;
INSERT INTO Album (AlbumId, Title, ArtistId) WITH RECURSIVE n(x) AS (SELECT 101 UNION ALL SELECT x+1 FROM n WHERE x<110) SELECT x, 'b', 2 FROM n;
INSERT INTO Album (AlbumId, Title, ArtistId) WITH RECURSIVE n(x) AS (SELECT 201 UNION ALL SELECT x+1 FROM n WHERE x<212) SELECT x, 'c', 3 FROM n;
INSERT INTO Album (AlbumId, Title, ArtistId) WITH RECURSIVE n(x) AS (SELECT 301 UNION ALL SELECT x+1 FROM n WHERE x<306) SELECT x, 'd', 5 FROM n;
INSERT INTO Album (AlbumId, Title, ArtistId) WITH RECURSIVE n(x) AS (SELECT 401 UNION ALL SELECT x+1 FROM n WHERE x<406) SELECT x, 'e', 6 FROM n;
