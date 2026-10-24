INSERT INTO Customer (CustomerId, FirstName, LastName, Country, Email) VALUES (1,'A','B','X','a@x.com');
WITH RECURSIVE n(i) AS (SELECT 1 UNION ALL SELECT i+1 FROM n WHERE i<20) INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total) SELECT i, 1, '2024-01-01 00:00:00', 'USA', CASE WHEN i<=10 THEN 1.00 ELSE 2.00 END FROM n;
WITH RECURSIVE n(i) AS (SELECT 21 UNION ALL SELECT i+1 FROM n WHERE i<40) INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total) SELECT i, 1, '2024-01-01 00:00:00', 'Chile', 0.99 FROM n;
WITH RECURSIVE n(i) AS (SELECT 41 UNION ALL SELECT i+1 FROM n WHERE i<59) INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total) SELECT i, 1, '2024-01-01 00:00:00', 'Canada', 5.00 FROM n;
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total) VALUES (60,1,'2024-01-01 00:00:00','Japan',9.00),(61,1,'2024-01-01 00:00:00','Japan',9.00);
