INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'C','One','c1@x.com'),(2,'C','Two','c2@x.com'),(3,'C','Three','c3@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1,1,'2025-01-05 10:00:00',10.00),
(2,1,'2025-01-20 00:00:00',5.00),
(3,2,'2025-02-05 00:00:00',7.00),
(4,2,'2025-12-31 23:59:59',4.00),
(5,3,'2024-12-31 23:59:59',99.00),
(6,3,'2026-01-01 00:00:00',99.00);
