INSERT INTO Employee (EmployeeId, LastName, FirstName) VALUES (1,'Adams','Andrew'),(2,'Edwards','Nancy');
INSERT INTO Customer (CustomerId, FirstName, LastName, Email, SupportRepId) VALUES (1,'C','One','c1@x.com',1),(2,'C','Two','c2@x.com',1),(3,'C','Three','c3@x.com',2);
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'T1',1,1000,0.99),(2,'T2',1,1000,0.99),(3,'T3',1,1000,0.99);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1,1,'2023-03-01 10:00:00',10.00),
(2,2,'2023-06-01 10:00:00',5.00),
(3,2,'2024-01-01 10:00:00',100.00),
(4,3,'2023-12-31 23:59:59',8.00),
(5,3,'2022-12-31 23:59:59',1.00);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,5.00,1),
(2,1,2,5.00,1),
(3,2,1,5.00,1),
(4,4,1,2.67,1),
(5,4,2,2.67,1),
(6,4,3,2.66,1),
(7,3,1,100.00,1),
(8,5,1,1.00,1);
