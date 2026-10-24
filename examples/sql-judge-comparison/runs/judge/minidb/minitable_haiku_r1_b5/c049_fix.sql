INSERT INTO Artist (ArtistId, Name) VALUES (1,'AC/DC'),(2,'Accept'),(3,'Aerosmith'),(4,'Queen');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'A1',1),(2,'A2',2),(3,'A3',3),(4,'A4',4);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES
(1,'T1',1,1,1,1000,0.99),(2,'T2',2,1,1,1000,0.99),(3,'T3',3,1,1,1000,0.99),(4,'T4',4,1,1,1000,0.99),(5,'T5',1,1,1,1000,0.99),(6,'T6',NULL,1,1,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email, Country) VALUES (1,'Greta','Muller','g@x.de','Germany'),(2,'Pierre','Dupont','p@x.fr','France'),(3,'Hans','Klein','h@x.de','Germany');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1,1,'2024-12-31 23:59:59',0),(2,1,'2023-12-31 23:59:59',0),(3,1,'2025-01-01 00:00:00',0),
(4,2,'2024-05-01 00:00:00',0),(5,3,'2024-06-01 00:00:00',0),(6,3,'2024-07-01 00:00:00',0);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,1.00,2),(2,1,4,1.00,1),(3,2,2,10.00,1),(4,3,3,10.00,1),(5,4,2,9.00,1),(6,5,2,3.00,1),(7,6,5,1.50,2),(8,5,6,5.00,1),(9,6,3,0.50,1);
