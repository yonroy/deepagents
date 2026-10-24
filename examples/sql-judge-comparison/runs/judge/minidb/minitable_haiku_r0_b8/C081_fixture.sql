INSERT INTO Customer (CustomerId, FirstName, LastName, Country, Email) VALUES
(1,'Lea','Muller','Germany','lea@x.de'),(2,'Jean','Dupont','France','jean@x.fr'),(3,'Hans','Schmidt','Germany','hans@x.de');
INSERT INTO Artist (ArtistId, Name) VALUES (1,'Artist A'),(2,'Artist B'),(3,'Artist C'),(4,'Artist D');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Album A',1),(2,'Album B',2),(3,'Album C',3),(4,'Album D',4);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'T1',1,1,NULL,NULL,200000,NULL,0.99),
(2,'T2',2,1,NULL,NULL,200000,NULL,0.99),
(3,'T3',3,1,NULL,NULL,200000,NULL,0.99),
(4,'T4',4,1,NULL,NULL,200000,NULL,0.99);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1,1,'2024-03-01 10:00:00',2.97),
(2,1,'2024-12-31 23:59:59',3.50),
(3,2,'2024-06-01 09:00:00',10.89),
(4,3,'2025-01-01 00:00:00',10.00),
(5,3,'2023-12-31 23:59:59',50.00),
(6,3,'2024-01-01 00:00:00',0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,0.99,1),
(2,1,2,0.99,2),
(3,2,3,1.00,3),
(4,2,4,0.50,1),
(5,3,1,0.99,11),
(6,4,4,0.50,20),
(7,5,3,1.00,50),
(8,6,2,0.99,1);
