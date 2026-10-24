INSERT INTO Employee (EmployeeId, LastName, FirstName, ReportsTo) VALUES (1,'Adams','Andrew',NULL),(2,'Edwards','Nancy',1);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email, SupportRepId) VALUES (1,'A','One','a1@x.com',2),(2,'B','Two','b2@x.com',2),(3,'C','Three','c3@x.com',1),(4,'D','Four','d4@x.com',NULL);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2023-06-15 00:00:00',10.00),(2,1,'2023-12-31 23:59:59',5.25),(3,1,'2024-01-01 00:00:00',99.00),(4,2,'2023-01-01 00:00:00',7.10),(5,3,'2023-03-03 00:00:00',3.33),(6,4,'2023-05-05 00:00:00',50.00);
