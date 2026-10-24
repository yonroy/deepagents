INSERT INTO Artist (ArtistId, Name) VALUES (1,'AC/DC'),(2,'Accept'),(3,'Aerosmith');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Al1',1),(2,'Al2',2);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1,1000,0.99),(2,'t2',2,1,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'A','One','a1@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2025-01-01 00:00:00',0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1);
