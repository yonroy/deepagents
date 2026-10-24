INSERT INTO Employee (EmployeeId, LastName, FirstName, ReportsTo) VALUES (1,'Adams','Andrew',NULL),(2,'Edwards','Nancy',1),(3,'Peacock','Jane',2);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email, SupportRepId) VALUES (1,'A','A','a@x',2),(2,'B','B','b@x',2),(3,'C','C','c@x',3);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1,1,'2023-01-01 00:00:00',10.00),(2,1,'2023-12-31 23:59:59',5.00),(3,1,'2022-12-31 23:59:59',100),(4,1,'2024-01-01 00:00:00',200),
(5,2,'2023-06-01 12:00:00',1.50),(6,3,'2022-05-05 00:00:00',7);
