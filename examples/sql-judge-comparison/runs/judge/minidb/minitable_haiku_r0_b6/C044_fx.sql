INSERT INTO Artist (ArtistId, Name) VALUES (1,'Prolific'),(2,'Many'),(3,'Ten');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
WITH RECURSIVE n(i) AS (SELECT 1 UNION ALL SELECT i+1 FROM n WHERE i<23) INSERT INTO Album (AlbumId, Title, ArtistId) SELECT i, 'Album ' || i, CASE WHEN i<=2 THEN 1 WHEN i<=13 THEN 2 ELSE 3 END FROM n;
WITH RECURSIVE n(i) AS (SELECT 1 UNION ALL SELECT i+1 FROM n WHERE i<12) INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) SELECT i, 'T' || i, (i-1)/6+1, 1, NULL, NULL, 200000, NULL, 0.99 FROM n;
WITH RECURSIVE n(i) AS (SELECT 13 UNION ALL SELECT i+1 FROM n WHERE i<33) INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) SELECT i, 'T' || i, i-10, 1, NULL, NULL, 200000, NULL, 0.99 FROM n;
