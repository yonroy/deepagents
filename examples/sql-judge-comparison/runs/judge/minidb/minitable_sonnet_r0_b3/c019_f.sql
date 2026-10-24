INSERT INTO Employee (EmployeeId,LastName,FirstName) VALUES (1,'Adams','Andrew'),(3,'Peacock','Jane'),(4,'Park','Margaret');
INSERT INTO Customer (CustomerId,FirstName,LastName,Email,SupportRepId) VALUES (1,'A','A','a@x',3),(2,'B','B','b@x',3),(3,'C','C','c@x',1),(4,'D','D','d@x',NULL);
INSERT INTO Invoice (InvoiceId,CustomerId,InvoiceDate,Total) VALUES
(1,1,'2023-01-01 00:00:00',10.00),
(2,2,'2023-12-31 23:59:59',5.50),
(3,1,'2022-12-31 23:59:59',100.00),
(4,1,'2024-01-01 00:00:00',200.00),
(5,3,'2022-06-01 00:00:00',7.00),
(6,4,'2023-05-05 00:00:00',50.00);
INSERT INTO InvoiceLine (InvoiceLineId,InvoiceId,TrackId,UnitPrice,Quantity) VALUES (1,1,1,1.00,5),(2,1,2,1.00,5),(3,2,1,1.00,1);
