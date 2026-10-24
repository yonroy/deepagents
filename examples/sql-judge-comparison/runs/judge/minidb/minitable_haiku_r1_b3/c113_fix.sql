INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file'), (2, 'Protected AAC audio file');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES
(1, 'T1', 1, 1000, 1.00),
(2, 'T2', 2, 1000, 0.99),
(3, 'T3', 2, 1000, 2.00);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1, 1, '2025-01-01 00:00:00', 2.99),
(2, 1, '2025-01-02 00:00:00', 3.00);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1, 1, 1, 1.00, 2),
(2, 1, 2, 0.99, 1),
(3, 2, 1, 1.00, 1),
(4, 2, 3, 2.00, 1);
