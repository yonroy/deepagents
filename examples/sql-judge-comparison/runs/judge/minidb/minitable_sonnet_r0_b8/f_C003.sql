INSERT INTO Customer (CustomerId, FirstName, LastName, Country, Email) VALUES (1,'G','One','Germany','1@x'),(2,'G','Two','Germany','2@x'),(3,'F','Three','France','3@x');
INSERT INTO Artist (ArtistId, Name) VALUES (1,'A1'),(2,'A2'),(3,'A3'),(4,'A4'),(5,'A5');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'al1',1),(2,'al2',2),(3,'al3',3),(4,'al4',4),(5,'al5',5);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'t1',1,1,1,NULL,1,1,0.99),(2,'t2',2,1,1,NULL,1,1,0.99),(3,'t3',3,1,1,NULL,1,1,0.99),(4,'t4',4,1,1,NULL,1,1,0.99),(5,'t5',5,1,1,NULL,1,1,0.99),(6,'t6',1,1,1,NULL,1,1,0.99);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total) VALUES
(1,1,'2024-12-31 23:59:59','Germany',10),
(2,2,'2024-01-01 00:00:00','Austria',10),
(3,1,'2023-12-31 23:59:59','Germany',10),
(4,1,'2025-01-01 00:00:00','Germany',10),
(5,3,'2024-06-01 00:00:00','Germany',10);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,1.00,3),(2,1,6,1.50,1),(3,1,2,2.00,1),
(4,2,3,5.00,1),(5,2,4,1.50,1),(6,2,5,0.50,1),(7,2,2,1.00,2),
(8,3,5,100,1),(9,4,5,100,1),(10,5,4,100,1);
