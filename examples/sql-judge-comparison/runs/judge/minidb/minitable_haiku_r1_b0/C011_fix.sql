INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'C','One','c1@x.com'),(2,'C','Two','c2@x.com'),(3,'C','Three','c3@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1,1,'2024-12-31 23:59:59',50.00),
(2,1,'2025-01-01 00:00:00',1.98),
(3,2,'2025-02-15 12:00:00',10.00),
(4,2,'2025-03-31 23:59:59',3.96),
(5,3,'2025-04-01 00:00:00',5.94);
