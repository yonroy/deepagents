INSERT INTO Artist (ArtistId, Name) VALUES (1,'Alpha'),(2,'Beta'),(3,'Gamma'),(4,'Delta'),(5,'Epsilon');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'A1',1),(2,'B1',2),(3,'G1',3),(4,'D1',4),(5,'E1',5);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES (1,'T1',1,1,1,1000,0.99),(2,'T2',2,1,1,1000,0.99),(3,'T3',3,1,1,1000,1.50),(4,'T4',4,1,1,1000,2.00),(5,'T5',5,1,1,1000,0.50);
INSERT INTO Customer (CustomerId, FirstName, LastName, Country, Email) VALUES (1,'Hans','Muller','Germany','hans@x.de'),(2,'Jean','Dupont','France','jean@x.fr');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (10,1,'2024-01-01 00:00:00',2.99),(11,1,'2024-12-31 23:59:59',5.49),(12,1,'2025-01-01 00:00:00',5.00),(13,1,'2023-12-31 23:59:59',9.00),(14,2,'2024-06-01 10:00:00',20.00),(15,1,'2024-07-01 00:00:00',0.50);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,10,1,1.00,2),(2,10,2,0.99,1),(3,11,3,1.50,3),(4,11,1,0.99,1),(5,12,2,5.00,1),(6,13,4,9.00,1),(7,14,4,2.00,10),(8,15,5,0.50,1);
