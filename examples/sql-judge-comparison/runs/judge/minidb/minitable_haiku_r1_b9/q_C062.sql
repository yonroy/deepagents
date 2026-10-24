SELECT BillingCountry, AVG(Total) AS avg_total FROM Invoice GROUP BY BillingCountry HAVING COUNT(*)>=20;
