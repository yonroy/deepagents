INSERT INTO Genre (GenreId,Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal');
INSERT INTO MediaType (MediaTypeId,Name) VALUES (1,'MPEG');
INSERT INTO Customer (CustomerId,FirstName,LastName,Email) VALUES (1,'A','A','a@x'),(2,'B','B','b@x'),(3,'C','C','c@x'),(4,'D','D','d@x'),(5,'E','E','e@x'),(6,'F','F','f@x');
INSERT INTO Track (TrackId,Name,MediaTypeId,GenreId,Milliseconds,UnitPrice) VALUES (1,'r1',1,1,1000,0.99),(2,'r2',1,1,1000,0.99),(3,'j1',1,2,1000,0.99),(4,'m1',1,3,1000,0.99);
INSERT INTO Invoice (InvoiceId,CustomerId,InvoiceDate,Total) VALUES (1,1,'2024-01-01 00:00:00',1),(2,1,'2024-01-02 00:00:00',1),(3,2,'2024-01-01 00:00:00',1),(4,3,'2024-01-01 00:00:00',1),(5,3,'2024-02-01 00:00:00',1),(6,4,'2024-01-01 00:00:00',1),(7,5,'2024-01-01 00:00:00',1),(8,6,'2024-01-01 00:00:00',1);
INSERT INTO InvoiceLine (InvoiceLineId,InvoiceId,TrackId,UnitPrice,Quantity) VALUES
(1,1,1,0.99,1),(2,1,2,0.99,1),(3,2,1,0.99,1),
(4,3,3,0.99,1),
(5,4,1,0.99,1),(6,5,3,0.99,1),
(7,6,1,0.99,1),(8,6,3,0.99,1),
(9,7,4,0.99,1),
(10,8,1,0.99,1),(11,8,4,0.99,1);
