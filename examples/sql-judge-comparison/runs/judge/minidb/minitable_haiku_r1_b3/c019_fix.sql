INSERT INTO Employee (EmployeeId, LastName, FirstName) VALUES
(1, 'Adams', 'Andrew'), (2, 'Edwards', 'Nancy'), (3, 'Peacock', 'Jane');
INSERT INTO Customer (CustomerId, FirstName, LastName, Email, SupportRepId) VALUES
(1, 'Ann', 'A', 'ann@c.com', 3),
(2, 'Bob', 'B', 'bob@c.com', 3),
(3, 'Cy', 'C', 'cy@c.com', 2),
(4, 'Di', 'D', 'di@c.com', NULL);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1, 1, '2023-06-01 10:00:00', 5.00),
(2, 1, '2023-12-31 23:59:59', 7.00),
(3, 1, '2024-01-01 00:00:00', 100.00),
(4, 2, '2023-03-15 00:00:00', 3.50),
(5, 2, '2022-12-31 23:59:59', 50.00),
(6, 3, '2023-07-07 00:00:00', 9.00),
(7, 4, '2023-07-07 00:00:00', 40.00);
