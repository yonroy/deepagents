INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Artist (ArtistId, Name) VALUES (1,'A');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Alb',1);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (1,'Rock Song',1,1,1,NULL,200000,NULL,0.99),(2,'Jazz Song',1,1,2,NULL,200000,NULL,0.99),(3,'Metal Song',1,1,3,NULL,200000,NULL,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'A','1','c1@x.com'),(2,'B','2','c2@x.com'),(3,'C','3','c3@x.com'),(4,'D','4','c4@x.com'),(5,'E','5','c5@x.com'),(6,'F','6','c6@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2025-01-01 00:00:00',0.99),(2,2,'2025-01-02 00:00:00',1.98),(3,3,'2025-01-03 00:00:00',0.99),(4,4,'2025-01-04 00:00:00',0.99),(5,5,'2025-01-05 00:00:00',0.99),(6,5,'2025-01-06 00:00:00',0.99),(7,6,'2025-01-07 00:00:00',0.99),(8,6,'2025-01-08 00:00:00',0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,2,1,0.99,1),(3,2,2,0.99,1),(4,3,2,0.99,1),(5,4,3,0.99,1),(6,5,1,0.99,1),(7,6,2,0.99,1),(8,7,1,0.99,1),(9,8,1,0.99,1);
