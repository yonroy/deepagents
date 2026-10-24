INSERT INTO Genre (GenreId, Name) VALUES (1, 'Rock'), (2, 'Jazz'), (3, 'Metal'), (4, 'Latin');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1, 'T1', NULL, 1, 1, NULL, 200000, NULL, 0.99),
(2, 'T2', NULL, 1, 1, NULL, 200000, NULL, 0.99),
(3, 'T3', NULL, 1, 1, NULL, 200000, NULL, 0.99),
(4, 'T4', NULL, 1, 3, NULL, 200000, NULL, 0.99),
(5, 'T5', NULL, 1, NULL, NULL, 200000, NULL, 0.99);
