INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'A','B','ab@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total) VALUES (1,1,'2024-02-01 00:00:00','Chile',10.00),(2,1,'2024-02-02 00:00:00','Chile',10.00),(3,1,'2024-02-03 00:00:00','Chile',5.00);
WITH RECURSIVE seq(n) AS (SELECT 1 UNION ALL SELECT n + 1 FROM seq WHERE n < 20) INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total) SELECT 3 + n, 1, '2024-03-01 00:00:00', 'Peru', 1.00 FROM seq;
WITH RECURSIVE seq(n) AS (SELECT 1 UNION ALL SELECT n + 1 FROM seq WHERE n < 21) INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total) SELECT 23 + n, 1, '2024-04-01 00:00:00', 'Bolivia', 0.50 FROM seq;
