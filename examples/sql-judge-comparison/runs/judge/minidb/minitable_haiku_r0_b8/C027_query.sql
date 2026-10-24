SELECT BillingCountry, ROUND(AVG(Total), 2) AS avg_total FROM Invoice GROUP BY BillingCountry HAVING SUM(Total) >= 20;
