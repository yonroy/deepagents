INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice, GenreId) VALUES (1,'R1',1,1000,0.99,1),(2,'J1',1,1000,0.99,2),(3,'M1',1,1000,0.99,3);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'C','One','c1@x.com'),(2,'C','Two','c2@x.com'),(3,'C','Three','c3@x.com'),(4,'C','Four','c4@x.com'),(5,'C','Five','c5@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1,1,'2025-01-01 10:00:00',0.99),
(2,1,'2025-01-02 10:00:00',0.99),
(3,2,'2025-01-03 10:00:00',0.99),
(4,3,'2025-01-04 10:00:00',0.99),
(5,4,'2025-01-05 10:00:00',1.98),
(6,5,'2025-01-06 10:00:00',1.98),
(7,2,'2025-01-07 10:00:00',0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,0.99,1),
(2,2,2,0.99,1),
(3,3,1,0.99,1),
(4,4,2,0.99,1),
(5,5,1,0.99,1),
(6,5,2,0.99,1),
(7,6,1,0.99,1),
(8,6,3,0.99,1),
(9,7,1,0.99,1);
