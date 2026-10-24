INSERT INTO MediaType VALUES (1,'m');
INSERT INTO Customer (CustomerId, FirstName, LastName, Country, Email) VALUES (1,'G','One','Germany','1'),(2,'G','Two','Germany','2'),(3,'F','Three','France','3');
INSERT INTO Artist VALUES (1,'Art1'),(2,'Art2'),(3,'Art3'),(4,'Art4'),(5,'Art5');
INSERT INTO Album VALUES (1,'al1',1),(2,'al2',2),(3,'al3',3),(4,'al4',4),(5,'al5',5);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES
(1,'t1',1,1,1000,1),(2,'t2',2,1,1000,1),(3,'t3',3,1,1000,1),(4,'t4',4,1,1000,1),(5,'t5',5,1,1000,1);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1,1,'2024-06-01 00:00:00',0),(2,1,'2024-12-31 23:59:59',0),(3,2,'2025-01-01 00:00:00',0),(4,2,'2023-12-31 23:59:59',0),(5,3,'2024-05-05 00:00:00',0),(6,2,'2024-01-01 00:00:00',0);
INSERT INTO InvoiceLine VALUES
(1,1,1,1.00,3),(2,1,2,2.00,1),
(3,2,3,1.00,4),(4,2,1,1.00,2),
(5,3,5,100,1),(6,4,5,100,1),(7,5,4,50,1),
(8,6,4,1.50,1),(9,6,2,1.00,1);
