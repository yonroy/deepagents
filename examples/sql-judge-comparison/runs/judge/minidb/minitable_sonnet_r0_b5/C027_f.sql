INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'a','a','a@x');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total)
WITH RECURSIVE n(i) AS (SELECT 1 UNION ALL SELECT i+1 FROM n WHERE i<21)
SELECT i, 1, '2021-01-01 00:00:00', 'A', 2.00 FROM n;
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total)
WITH RECURSIVE n(i) AS (SELECT 101 UNION ALL SELECT i+1 FROM n WHERE i<103)
SELECT i, 1, '2021-01-01 00:00:00', 'B', 10.00 FROM n;
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total)
WITH RECURSIVE n(i) AS (SELECT 201 UNION ALL SELECT i+1 FROM n WHERE i<220)
SELECT i, 1, '2021-01-01 00:00:00', 'C', 0.50 FROM n;
