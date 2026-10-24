INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, Email) VALUES
(1, 'Adams', 'Andrew', 'General Manager', NULL, 'andrew@x.com'),
(2, 'Edwards', 'Nancy', 'Sales Manager', 1, 'nancy@x.com'),
(3, 'Peacock', 'Jane', 'Sales Support Agent', 2, 'jane@x.com');
INSERT INTO Customer (CustomerId, FirstName, LastName, Email, SupportRepId) VALUES
(1, 'Ann', 'A', 'ann@c.com', 1),
(2, 'Bob', 'B', 'bob@c.com', 1),
(3, 'Cy', 'C', 'cy@c.com', 3);
