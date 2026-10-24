INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file'),(2,'Protected AAC audio file'),(3,'Protected MPEG-4 video file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'A',NULL,2,NULL,NULL,1000,NULL,0.99),
(2,'B',NULL,2,NULL,NULL,1000,NULL,1.99),
(3,'C',NULL,1,NULL,NULL,1000,NULL,0.99),
(4,'D',NULL,3,NULL,NULL,1000,NULL,5.00);
