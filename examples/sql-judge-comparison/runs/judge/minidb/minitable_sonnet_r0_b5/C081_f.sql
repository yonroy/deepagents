INSERT INTO Artist (ArtistId, Name) VALUES (1,'A1'),(2,'A2'),(3,'A3'),(4,'A4'),(5,'A5');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Al1',1),(2,'Al2',2),(3,'Al3',3),(4,'Al4',4),(5,'Al5',5);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'m');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1,1000,0.99),(2,'t2',2,1,1000,0.99),(3,'t3',3,1,1000,0.50),(4,'t4',4,1,1000,0.99),(5,'t5',5,1,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email, Country) VALUES (1,'De','One','d@x','Germany'),(2,'Fr','Two','f@x','France');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingCountry, Total) VALUES
(1,1,'2024-06-01 00:00:00','Germany',3.00),
(2,2,'2024-06-02 00:00:00','France',10.00),
(3,1,'2024-12-31 23:59:59','Germany',0.50),
(4,1,'2025-01-01 00:00:00','Germany',0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,0.99,1),(2,1,2,0.99,2),(3,2,5,0.99,10),(4,3,3,0.50,1),(5,4,4,0.99,1);
