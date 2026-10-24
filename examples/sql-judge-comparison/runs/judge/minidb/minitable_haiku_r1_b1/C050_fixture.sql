INSERT INTO Employee (EmployeeId, LastName, FirstName) VALUES (1,'Adams','Andrew'),(2,'Edwards','Nancy'),(3,'Peacock','Jane');
INSERT INTO Customer (CustomerId, FirstName, LastName, Email, SupportRepId) VALUES (1,'C','One','a@x.com',2),(2,'C','Two','b@x.com',2),(3,'C','Three','c@x.com',3),(4,'C','Four','d@x.com',NULL);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2023-06-01 00:00:00',10.00),(2,2,'2023-12-31 23:59:59',5.50),(3,1,'2024-01-01 00:00:00',7.00),(4,3,'2022-12-31 23:59:59',4.00),(5,3,'2023-03-03 09:00:00',2.25),(6,4,'2023-05-05 00:00:00',9.00);
