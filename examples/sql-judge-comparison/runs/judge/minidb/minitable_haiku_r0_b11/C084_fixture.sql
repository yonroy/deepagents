INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES
(1, 'Luís', 'Gonçalves', 'luisg@embraer.com.br'),
(2, 'Leonie', 'Köhler', 'leonekohler@surfeu.de'),
(3, 'François', 'Tremblay', 'ftremblay@gmail.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1, 1, '2021-01-01 00:00:00', 1.98),
(2, 1, '2021-01-02 00:00:00', 13.85),
(3, 2, '2021-01-03 00:00:00', 13.86),
(4, 2, '2021-01-04 00:00:00', 13.87),
(5, 3, '2021-01-05 00:00:00', 0.99),
(6, 3, '2021-01-06 00:00:00', 27.00);
