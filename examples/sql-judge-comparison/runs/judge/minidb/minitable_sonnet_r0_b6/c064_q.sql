SELECT Country, COUNT(*) AS n_customers FROM Customer GROUP BY Country HAVING COUNT(*) > 5;
