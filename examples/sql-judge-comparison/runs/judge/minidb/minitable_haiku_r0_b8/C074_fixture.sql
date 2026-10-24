INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file'),(2,'Protected AAC audio file'),(3,'Protected MPEG-4 video file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'T1',NULL,1,NULL,NULL,200000,NULL,0.99),
(2,'T2',NULL,2,NULL,NULL,200000,NULL,0.99),
(3,'T3',NULL,1,NULL,NULL,200000,NULL,0.99),
(4,'V1',NULL,3,NULL,NULL,900000,NULL,2.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'Ann','Lee','ann@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-01-01 00:00:00',2.97),(2,1,'2024-01-02 00:00:00',3.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,0.99,1),
(2,1,2,0.99,2),
(3,2,3,1.00,3),
(4,2,2,0.99,1);
