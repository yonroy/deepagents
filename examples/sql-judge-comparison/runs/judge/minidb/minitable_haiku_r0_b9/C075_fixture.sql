INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'A','B','a@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1,1,'2023-12-31 23:59:59',1000.00),
(2,1,'2024-01-01 00:00:00',100.00),
(3,1,'2024-12-31 23:59:59',100.00),
(4,1,'2025-01-01 00:00:00',150.00),
(5,1,'2025-06-01 12:00:00',100.00),
(6,1,'2026-01-01 00:00:00',500.00);
