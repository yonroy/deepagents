INSERT INTO Artist (ArtistId, Name) VALUES (1,'Sold Band'),(2,'Unsold Band'),(3,'No Album Artist'),(4,'Mixed Band'),(5,'Album No Track');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'A1',1),(2,'A2',2),(3,'A3',4),(4,'A4',4),(5,'A5',5);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'T1',1,1,NULL,NULL,200000,NULL,0.99),
(2,'T2',2,1,NULL,NULL,200000,NULL,0.99),
(3,'T3',2,1,NULL,NULL,200000,NULL,0.99),
(4,'T4',3,1,NULL,NULL,200000,NULL,0.99),
(5,'T5',4,1,NULL,NULL,200000,NULL,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'Ann','Lee','ann@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-01-01 00:00:00',1.98);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,0.99,1),
(2,1,5,0.99,1);
