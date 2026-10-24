INSERT INTO Artist (ArtistId, Name) VALUES (1,'Alpha'),(2,'Beta'),(3,'Gamma'),(4,'Delta'),(5,'Alpha');
WITH RECURSIVE seq(x) AS (SELECT 1 UNION ALL SELECT x+1 FROM seq WHERE x<11) INSERT INTO Album (AlbumId, Title, ArtistId) SELECT x, 'A1-'||x, 1 FROM seq;
WITH RECURSIVE seq(x) AS (SELECT 101 UNION ALL SELECT x+1 FROM seq WHERE x<110) INSERT INTO Album (AlbumId, Title, ArtistId) SELECT x, 'B-'||x, 2 FROM seq;
WITH RECURSIVE seq(x) AS (SELECT 201 UNION ALL SELECT x+1 FROM seq WHERE x<212) INSERT INTO Album (AlbumId, Title, ArtistId) SELECT x, 'G-'||x, 3 FROM seq;
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (301, 'D-1', 4), (401, 'A2-1', 5), (402, 'A2-2', 5);
