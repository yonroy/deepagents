INSERT INTO Artist (ArtistId, Name) VALUES (1,'AC/DC'),(2,'Accept'),(3,'Aerosmith'),(4,'Scorpions');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'A1',1),(2,'A2',2),(3,'A3',3),(4,'A4',4);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (1,'T1',1,1,NULL,NULL,200000,NULL,0.99),(2,'T2',2,1,NULL,NULL,200000,NULL,1.00),(3,'T3',3,1,NULL,NULL,200000,NULL,5.00),(4,'T4',4,1,NULL,NULL,200000,NULL,0.99),(5,'T5',1,1,NULL,NULL,200000,NULL,2.00);
INSERT INTO Customer (CustomerId, FirstName, LastName, Country, Email) VALUES (1,'Leonie','Köhler','Germany','l@x.com'),(2,'Luís','Gonçalves','Brazil','g@x.com'),(3,'Hans','Müller','Germany','h@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-01-01 00:00:00',1.98),(2,1,'2024-12-31 23:59:59',8.00),(3,1,'2025-01-01 00:00:00',100.00),(4,1,'2023-12-31 23:59:59',9.00),(5,2,'2024-06-01 00:00:00',10.00),(6,3,'2024-07-01 00:00:00',5.96);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,2),(2,2,2,1.00,3),(3,2,3,5.00,1),(4,4,4,9.00,1),(5,5,1,10.00,1),(6,6,4,0.99,4),(7,6,5,2.00,1),(8,3,2,100.00,1);
