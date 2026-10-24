INSERT INTO Employee (EmployeeId,LastName,FirstName) VALUES (1,'Adams','Andrew');
INSERT INTO Customer (CustomerId,FirstName,LastName,Email,SupportRepId) VALUES (1,'A','A','a@x',1);
INSERT INTO Invoice (InvoiceId,CustomerId,InvoiceDate,Total) VALUES (1,1,'2023-05-01 00:00:00',10),(2,1,'2023-12-31 23:00:00',5),(3,1,'2024-01-01 00:00:00',100);
INSERT INTO InvoiceLine (InvoiceLineId,InvoiceId,TrackId,UnitPrice,Quantity) VALUES (1,1,1,5,1),(2,1,2,5,1),(3,2,1,5,1),(4,3,1,100,1);
