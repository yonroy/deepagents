INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file');
INSERT INTO Artist (ArtistId, Name) VALUES (1,'Accept'),(2,'Aerosmith'),(3,'AC/DC'),(4,'Scorpions');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Album A1',1),(2,'Album A2',1),(3,'Album B',2),(4,'Album C',3),(5,'Album D',4);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'T1',1,1,1000,0.99),(2,'T2',2,1,1000,1.50),(3,'T3',3,1,1000,0.99),(4,'T4',4,1,1000,0.99),(5,'T5',5,1,1000,1.00);
INSERT INTO Customer (CustomerId, FirstName, LastName, Country, Email) VALUES (1,'Anna','Berg','Germany','anna@example.com'),(2,'Paul','Dupont','France','paul@example.com'),(3,'Klaus','Neu','Germany','klaus@example.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total) VALUES (1,1,'2024-06-15 10:00:00','Germany',2.97),(2,3,'2024-12-31 23:59:59','Germany',4.50),(3,1,'2025-01-01 00:00:00','Germany',9.90),(4,1,'2023-12-31 23:59:59','Germany',4.95),(5,2,'2024-03-01 09:00:00','Germany',100.00),(6,3,'2024-07-01 08:00:00','Germany',8.96);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,2),(2,1,3,0.99,1),(3,2,2,1.50,3),(4,3,1,0.99,10),(5,4,4,0.99,5),(6,5,5,2.00,50),(7,6,4,0.99,4),(8,6,5,1.00,5);
