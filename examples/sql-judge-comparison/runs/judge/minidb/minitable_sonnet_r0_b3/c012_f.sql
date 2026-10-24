INSERT INTO Customer (CustomerId,FirstName,LastName,Email) VALUES (1,'A','A','a@x');
INSERT INTO Invoice (InvoiceId,CustomerId,InvoiceDate,Total) VALUES
(1,1,'2025-01-05 00:00:00',1.00),
(2,1,'2025-02-05 00:00:00',2.00),
(3,1,'2025-02-20 10:00:00',3.00),
(4,1,'2025-12-31 23:59:59',4.00),
(5,1,'2024-12-31 23:59:59',100.00),
(6,1,'2026-01-01 00:00:00',200.00);
