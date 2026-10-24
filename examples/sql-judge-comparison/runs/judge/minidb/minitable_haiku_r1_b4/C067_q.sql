SELECT e.FirstName || ' ' || e.LastName AS employee_name, m.FirstName || ' ' || m.LastName AS manager_name FROM Employee e LEFT JOIN Employee m ON m.EmployeeId = e.ReportsTo;
