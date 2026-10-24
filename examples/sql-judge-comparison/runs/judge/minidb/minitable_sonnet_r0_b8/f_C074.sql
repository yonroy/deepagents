INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'Audio'),(2,'Video'),(3,'Unsold');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'T1',1,1,1,NULL,1000,1000,0.99),
(2,'T2',1,2,1,NULL,1000,1000,0.99),
(3,'T3',1,1,1,NULL,1000,1000,0.99),
(4,'T4',1,3,1,NULL,1000,1000,0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,1.00,2),(2,1,2,3.00,1),(3,2,3,1.00,3);
