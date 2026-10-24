INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file'),(2,'Protected AAC audio file'),(3,'Protected MPEG-4 video file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'T1',NULL,1,NULL,NULL,1000,NULL,0.99),
(2,'T2',NULL,2,NULL,NULL,1000,NULL,3.00),
(3,'T3',NULL,3,NULL,NULL,1000,NULL,0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,0.99,1),
(2,1,1,0.99,2),
(3,1,2,3.00,1),
(4,1,3,0.99,1);
