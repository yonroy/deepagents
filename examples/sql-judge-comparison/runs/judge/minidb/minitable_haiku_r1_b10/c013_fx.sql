INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file');
INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal'),(4,'Pop'),(5,'Blues'),(6,'Classical');
INSERT INTO Track (TrackId, Name, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES
(1,'Rock A',1,1,200000,0.99),
(2,'Jazz A',1,2,200000,0.99),
(3,'Metal A',1,3,200000,1.99),
(4,'Pop A',1,4,200000,0.49),
(5,'Blues A',1,5,200000,0.99),
(6,'Classical A',1,6,200000,1.49);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-01-01 00:00:00',10.00);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,0.99,3),(2,1,3,1.99,2),(3,1,1,0.99,1),(4,1,4,0.49,1),(5,1,2,0.99,1),(6,1,5,0.99,2),(7,1,6,1.49,1);
