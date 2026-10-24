WITH RECURSIVE seq(n) AS (SELECT 1 UNION ALL SELECT n+1 FROM seq WHERE n < 19)
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total)
SELECT n, 1, '2024-05-01 00:00:00', 'Germany', 1.00 FROM seq;
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total) VALUES (20, 1, '2024-05-02 00:00:00', 'Germany', 5.00);
WITH RECURSIVE seq(n) AS (SELECT 21 UNION ALL SELECT n+1 FROM seq WHERE n < 39)
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total)
SELECT n, 1, '2024-06-01 00:00:00', 'France', 10.00 FROM seq;
WITH RECURSIVE seq(n) AS (SELECT 40 UNION ALL SELECT n+1 FROM seq WHERE n < 60)
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total)
SELECT n, 1, '2024-07-01 00:00:00', 'Brazil', 2.00 FROM seq;
