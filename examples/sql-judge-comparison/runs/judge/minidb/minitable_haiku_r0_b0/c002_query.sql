SELECT e.FirstName, e.LastName, m.FirstName AS manager_first, m.LastName AS manager_last FROM Employee e JOIN Employee m ON m.EmployeeId = e.ReportsTo;
