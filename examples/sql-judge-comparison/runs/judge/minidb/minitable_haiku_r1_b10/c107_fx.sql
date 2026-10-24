INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
WITH RECURSIVE seq(n) AS (SELECT 1 UNION ALL SELECT n+1 FROM seq WHERE n < 12)
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice)
SELECT n, 'Track ' || n, 1, n*10000, 0.99 FROM seq;
