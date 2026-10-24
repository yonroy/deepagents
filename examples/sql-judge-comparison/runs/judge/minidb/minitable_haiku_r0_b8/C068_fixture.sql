INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal'),(4,'Latin'),(5,'Pop'),(6,'Blues'),(7,'Classical');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'T1',NULL,1,1,NULL,200000,NULL,0.99),
(2,'T2',NULL,1,2,NULL,200000,NULL,0.99),
(3,'T3',NULL,1,3,NULL,200000,NULL,0.99),
(4,'T4',NULL,1,4,NULL,200000,NULL,0.99),
(5,'T5',NULL,1,5,NULL,200000,NULL,0.99),
(6,'T6',NULL,1,6,NULL,200000,NULL,0.99),
(7,'T7',NULL,1,NULL,NULL,200000,NULL,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'Ann','Lee','ann@x.com'),(2,'Bob','Stone','bob@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-02-01 10:00:00',7.93),(2,2,'2024-03-01 10:00:00',13.37);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,0.99,4),
(2,1,2,1.00,1),
(3,1,3,0.99,2),
(4,1,4,0.99,1),
(5,2,5,0.99,3),
(6,2,6,0.50,1),
(7,2,7,0.99,10);
