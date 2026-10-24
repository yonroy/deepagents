INSERT INTO Artist (ArtistId, Name) VALUES (1,'Alpha'),(2,'Beta'),(3,'Gamma'),(4,'Delta'),(5,'Epsilon');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'A1',1),(2,'A2',1),(3,'B1',2),(4,'G1',3),(5,'D1',4);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'T1',1,1,1000,1.00),(2,'T2',2,1,1000,1.00),(3,'T3',3,1,1000,1.00),(4,'T4',4,1,1000,1.00),(5,'T5',5,1,1000,1.00);
INSERT INTO Customer (CustomerId, FirstName, LastName, Country, Email) VALUES (1,'Hans','Muller','Germany','h@x.de'),(2,'Marie','Dupont','France','m@x.fr'),(3,'Klaus','Weber','Germany','k@x.de');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-06-01 10:00:00',4.00),(2,1,'2024-12-31 23:59:59',3.00),(3,1,'2025-01-01 00:00:00',10.00),(4,1,'2023-12-31 12:00:00',10.00),(5,2,'2024-06-01 10:00:00',9.00),(6,3,'2024-03-15 08:00:00',7.00);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,2.00,1),(2,1,3,1.00,2),(3,2,2,3.00,1),(4,3,1,10.00,1),(5,4,4,10.00,1),(6,5,4,9.00,1),(7,6,4,4.00,1),(8,6,5,1.50,2);
