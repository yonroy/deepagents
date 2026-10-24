INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (2, 'Protected AAC audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (1, 'T1', NULL, 1, 1, NULL, 1000, 100, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (2, 'T2', NULL, 2, 1, NULL, 1000, 100, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (3, 'T3', NULL, 2, 1, NULL, 1000, 100, 1.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (4, 'T4', NULL, 2, 1, NULL, 1000, 100, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (5, 'T5', NULL, 1, 1, NULL, 1000, 100, 5.00);
