SELECT e.FirstName, e.LastName, COUNT(*) AS n_customers FROM Employee e LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId GROUP BY e.EmployeeId;
