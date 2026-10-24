SELECT Country, COUNT(*) AS customer_count FROM Customer WHERE Country IS NOT NULL GROUP BY Country HAVING COUNT(*) >= 5;
