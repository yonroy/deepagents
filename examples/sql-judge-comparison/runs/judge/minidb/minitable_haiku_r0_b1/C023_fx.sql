INSERT INTO Employee (EmployeeId, LastName, FirstName) VALUES (1,'Adams','Andrew'),(2,'Edwards','Nancy'),(3,'Peacock','Jane');
INSERT INTO Customer (CustomerId, FirstName, LastName, Email, SupportRepId) VALUES (1,'A','A','a1@x.com',1),(2,'B','B','b2@x.com',1),(3,'C','C','c3@x.com',2);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2022-12-31 23:59:59',50.00),(2,1,'2023-03-01 09:00:00',5.00),(3,1,'2023-12-31 23:00:00',2.00),(4,1,'2024-01-01 00:00:00',100.00),(5,2,'2023-06-01 12:00:00',3.00),(6,3,'2023-07-01 12:00:00',4.00),(7,3,'2023-01-01 00:00:00',1.50);
