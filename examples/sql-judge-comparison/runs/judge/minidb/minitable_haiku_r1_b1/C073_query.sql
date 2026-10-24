SELECT strftime('%m', InvoiceDate) AS month, ROUND(SUM(Total), 2) AS revenue FROM Invoice WHERE strftime('%Y', InvoiceDate) = '2025' GROUP BY strftime('%m', InvoiceDate) ORDER BY month;
