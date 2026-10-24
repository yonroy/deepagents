INSERT INTO Customer (CustomerId, FirstName, LastName, Country, Email) VALUES (1,'C','X','A','1@x');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
 (1,1,'2023-12-31 23:59:59',100.00),
 (2,1,'2024-01-01 00:00:00',10.00),
 (3,1,'2024-12-31 23:59:59',5.50),
 (4,1,'2025-01-01 00:00:00',20.00),
 (5,1,'2025-12-31 18:30:00',7.25),
 (6,1,'2026-01-01 00:00:00',50.00);
