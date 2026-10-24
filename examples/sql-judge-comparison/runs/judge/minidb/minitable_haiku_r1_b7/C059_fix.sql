INSERT INTO Artist (ArtistId, Name) VALUES (1,'Alpha Band'),(2,'Beta Band'),(3,'Gamma Band'),(4,'Delta Band');
INSERT INTO Album (AlbumId, Title, ArtistId) WITH RECURSIVE s(n) AS (SELECT 1 UNION ALL SELECT n+1 FROM s WHERE n<11) SELECT n, 'Alpha Album '||n, 1 FROM s;
INSERT INTO Album (AlbumId, Title, ArtistId) WITH RECURSIVE s(n) AS (SELECT 1 UNION ALL SELECT n+1 FROM s WHERE n<10) SELECT n+100, 'Beta Album '||n, 2 FROM s;
INSERT INTO Album (AlbumId, Title, ArtistId) WITH RECURSIVE s(n) AS (SELECT 1 UNION ALL SELECT n+1 FROM s WHERE n<12) SELECT n+200, 'Gamma Album '||n, 3 FROM s;
