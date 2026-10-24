INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file'),(2,'Protected AAC audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (1,'T1',NULL,1,NULL,NULL,1000,NULL,0.99),(2,'T2',NULL,2,NULL,NULL,1000,NULL,1.00),(3,'T3',NULL,1,NULL,NULL,1000,NULL,0.50);
INSERT INTO Customer (CustomerId, FirstName, LastName, Country, Email) VALUES (1,'A','B','X','a@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-01-01 00:00:00',1.98),(2,1,'2024-02-01 00:00:00',1.00),(3,1,'2024-03-01 00:00:00',2.00);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,2),(2,2,2,1.00,1),(3,3,3,0.50,4);
