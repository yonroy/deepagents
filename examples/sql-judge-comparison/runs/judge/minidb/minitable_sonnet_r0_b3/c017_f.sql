INSERT INTO Customer (CustomerId,FirstName,LastName,Email) VALUES (1,'A','A','a@x');
INSERT INTO Invoice (InvoiceId,CustomerId,InvoiceDate,Total) VALUES
(1,1,'2025-01-01 00:00:00',1.00),
(2,1,'2025-03-31 23:59:59',2.00),
(3,1,'2025-03-15 12:30:00',4.00),
(4,1,'2025-04-01 00:00:00',100.00),
(5,1,'2024-12-31 23:59:59',1000.00),
(6,1,'2024-03-10 00:00:00',10000.00);
