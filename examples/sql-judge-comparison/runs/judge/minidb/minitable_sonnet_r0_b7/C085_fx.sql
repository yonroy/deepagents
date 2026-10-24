INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total)
WITH RECURSIVE n(x) AS (SELECT 1 UNION ALL SELECT x+1 FROM n WHERE x < 19)
SELECT x, 1, '2021-01-01 00:00:00', 'A', 2.00 FROM n;
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total) VALUES (20, 1, '2021-01-01 00:00:00', 'A', 3.00);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total)
WITH RECURSIVE n(x) AS (SELECT 101 UNION ALL SELECT x+1 FROM n WHERE x < 119)
SELECT x, 1, '2021-01-01 00:00:00', 'B', 10.00 FROM n;
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total)
WITH RECURSIVE n(x) AS (SELECT 201 UNION ALL SELECT x+1 FROM n WHERE x < 220)
SELECT x, 1, '2021-01-01 00:00:00', 'C', 5.00 FROM n;
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total)
WITH RECURSIVE n(x) AS (SELECT 301 UNION ALL SELECT x+1 FROM n WHERE x < 325)
SELECT x, 1, '2021-01-01 00:00:00', NULL, 50.00 FROM n;
