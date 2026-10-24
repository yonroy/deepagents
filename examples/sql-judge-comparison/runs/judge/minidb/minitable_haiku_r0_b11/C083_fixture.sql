INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file'), (2, 'Protected AAC audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1, 'Track MP3 A', NULL, 1, NULL, NULL, 200000, 1000, 5.00),
(2, 'Track AAC A', NULL, 2, NULL, NULL, 200000, 1000, 0.99),
(3, 'Track AAC B', NULL, 2, NULL, NULL, 200000, 1000, 1.99),
(4, 'Track AAC C', NULL, 2, NULL, NULL, 200000, 1000, 0.50),
(5, 'Track MP3 B', NULL, 1, NULL, NULL, 200000, 1000, 0.99);
