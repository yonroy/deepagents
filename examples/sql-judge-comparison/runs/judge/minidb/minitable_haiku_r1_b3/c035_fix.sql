INSERT INTO Genre (GenreId, Name) VALUES (1, 'Rock'), (2, 'Jazz'), (3, 'Metal');
INSERT INTO Track (TrackId, Name, GenreId, MediaTypeId, Milliseconds, UnitPrice) VALUES
(1, 'Rock song', 1, 1, 1000, 0.99),
(2, 'Jazz song', 2, 1, 1000, 0.99),
(3, 'Metal song', 3, 1, 1000, 0.99);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1, 1, '2025-01-01 00:00:00', 0.99),
(2, 2, '2025-01-02 00:00:00', 0.99),
(3, 3, '2025-01-03 00:00:00', 0.99),
(4, 3, '2025-01-04 00:00:00', 0.99),
(5, 4, '2025-01-05 00:00:00', 1.98),
(6, 5, '2025-01-06 00:00:00', 1.98),
(7, 6, '2025-01-07 00:00:00', 1.98);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1, 1, 1, 0.99, 1),
(2, 2, 2, 0.99, 1),
(3, 3, 1, 0.99, 1),
(4, 4, 2, 0.99, 1),
(5, 5, 1, 0.99, 1),
(6, 5, 1, 0.99, 1),
(7, 6, 2, 0.99, 1),
(8, 6, 3, 0.99, 1),
(9, 7, 1, 0.99, 1),
(10, 7, 2, 0.99, 1);
