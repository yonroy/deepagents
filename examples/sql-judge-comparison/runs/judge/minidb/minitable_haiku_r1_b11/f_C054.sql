INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file'), (2, 'Protected AAC audio file'), (3, 'Protected MPEG-4 video file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1, 'Song A', NULL, 2, NULL, NULL, 200000, NULL, 0.99),
(2, 'Song B', NULL, 2, NULL, NULL, 210000, NULL, 1.99),
(3, 'Song C', NULL, 2, NULL, NULL, 220000, NULL, 2.99),
(4, 'Song D', NULL, 1, NULL, NULL, 230000, NULL, 9.99),
(5, 'Video E', NULL, 3, NULL, NULL, 240000, NULL, 4.99);
