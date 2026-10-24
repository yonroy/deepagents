SELECT e.EmployeeId, e.FirstName, e.LastName, COUNT(c.CustomerId) AS n FROM Employee e LEFT JOIN Customer c ON c.SupportRepId=e.EmployeeId GROUP BY e.EmployeeId;
