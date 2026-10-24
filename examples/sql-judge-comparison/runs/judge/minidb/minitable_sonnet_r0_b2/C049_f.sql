INSERT INTO Artist (ArtistId,Name) VALUES (1,'A1'),(2,'A2'),(3,'A3'),(4,'A4'),(5,'A5');
INSERT INTO Album (AlbumId,Title,ArtistId) VALUES (1,'al1',1),(2,'al2',2),(3,'al3',3),(4,'al4',4),(5,'al5',5);
INSERT INTO MediaType (MediaTypeId,Name) VALUES (1,'MPEG');
INSERT INTO Track (TrackId,Name,AlbumId,MediaTypeId,Milliseconds,UnitPrice) VALUES (1,'t1',1,1,1000,0.99),(2,'t2',2,1,1000,1.99),(3,'t3',3,1,1000,1.50),(4,'t4',4,1,1000,0.99),(5,'t5',5,1,1000,0.50),(6,'t6',NULL,1,1000,9.99);
INSERT INTO Customer (CustomerId,FirstName,LastName,Email,Country) VALUES (1,'A','A','a@x','Germany'),(2,'B','B','b@x','France');
INSERT INTO Invoice (InvoiceId,CustomerId,InvoiceDate,Total) VALUES
(1,1,'2024-05-01 00:00:00',1),(2,1,'2024-12-31 22:00:00',1),(3,1,'2023-12-31 23:59:59',1),(4,2,'2024-06-01 00:00:00',1),(5,1,'2025-01-01 00:00:00',1);
INSERT INTO InvoiceLine (InvoiceLineId,InvoiceId,TrackId,UnitPrice,Quantity) VALUES
(1,1,1,0.99,1),(2,1,2,1.99,3),(3,1,3,1.50,2),
(4,2,4,0.99,1),(5,2,1,0.99,1),(6,2,6,9.99,1),(7,2,5,0.50,1),
(8,3,5,100,1),(9,4,5,100,1),(10,5,5,100,1);
