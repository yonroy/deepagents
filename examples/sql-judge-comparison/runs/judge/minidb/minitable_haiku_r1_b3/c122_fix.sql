INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file');
INSERT INTO Artist (ArtistId, Name) VALUES (1, 'Artist One');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES
(1, 'Album 1', 1), (2, 'Album 2', 1), (3, 'Album 3', 1), (4, 'Album 4', 1), (5, 'Album 5', 1), (6, 'Album 6', 1);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Composer, Milliseconds, UnitPrice) VALUES
(1, 'T1', 1, 1, 'X', 2000000, 0.99),
(2, 'T2', 1, 1, NULL, 1600001, 0.99),
(3, 'T3', 2, 1, 'Y', 1800000, 0.99),
(4, 'T4', 2, 1, NULL, 1800000, 0.99),
(5, 'T5', 3, 1, 'Z', 4000000, 0.99),
(6, 'T6', 4, 1, '   ', 3700000, 0.99),
(7, 'T7', 6, 1, NULL, 1000000, 0.99);
