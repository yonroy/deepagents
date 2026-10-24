SELECT strftime('%m', InvoiceDate) AS month, SUM(Total) AS revenue FROM Invoice WHERE InvoiceDate>='2025-01-01' AND InvoiceDate<'2026-01-01' GROUP BY month ORDER BY month;
