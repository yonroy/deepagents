INSERT INTO Customer (CustomerId, FirstName, LastName, Email, Country) VALUES (1,'Anna','Berg','anna@x.de','Germany'),(2,'Jean','Dupont','jean@x.fr','France');
INSERT INTO Artist (ArtistId, Name) VALUES (1,'Alpha'),(2,'Beta'),(3,'Gamma'),(4,'Delta');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'A1',1),(2,'B1',2),(3,'C1',3),(4,'D1',4);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1,200000,0.99),(2,'t2',2,1,200000,0.99),(3,'t3',3,1,200000,0.99),(4,'t4',4,1,200000,0.99),(5,'t5',NULL,1,200000,0.99);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-03-01 00:00:00',2.97),(2,1,'2024-12-31 23:59:59',6.95),(3,1,'2023-12-31 23:59:59',9.90),(4,1,'2025-01-01 00:00:00',9.90),(5,2,'2024-06-01 00:00:00',99.00);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,2),(2,1,2,0.99,1),(3,2,2,1.00,3),(4,2,3,0.99,4),(5,2,5,0.99,1),(6,3,4,0.99,10),(7,4,4,0.99,10),(8,5,1,0.99,100);
