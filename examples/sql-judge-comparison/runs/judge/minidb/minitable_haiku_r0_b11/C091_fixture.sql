INSERT INTO Genre (GenreId, Name) VALUES (1, 'Rock'), (2, 'Jazz'), (3, 'Metal');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES
(1, 'T1', NULL, 1, 1, 200000, 0.99),
(2, 'T2', NULL, 1, 1, 210000, 0.99),
(3, 'T3', NULL, 1, 2, 220000, 0.99),
(4, 'T4', NULL, 1, 2, 230000, 0.99),
(5, 'T5', NULL, 1, NULL, 240000, 0.99);
