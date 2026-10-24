INSERT INTO Employee (EmployeeId,LastName,FirstName) VALUES (1,'Adams','Andrew'),(2,'Edwards','Nancy'),(3,'Peacock','Jane');
INSERT INTO Customer (CustomerId,FirstName,LastName,Email,SupportRepId) VALUES (1,'A','A','a@x',2),(2,'B','B','b@x',2),(3,'C','C','c@x',3);
INSERT INTO Invoice (InvoiceId,CustomerId,InvoiceDate,Total) VALUES
(1,1,'2023-01-01 00:00:00',10.00),
(2,1,'2023-12-31 15:30:00',5.00),
(3,2,'2024-01-01 00:00:00',100.00),
(4,2,'2022-12-31 23:59:59',200.00),
(5,3,'2023-06-15 00:00:00',7.50),
(6,2,'2023-03-03 00:00:00',2.50);
