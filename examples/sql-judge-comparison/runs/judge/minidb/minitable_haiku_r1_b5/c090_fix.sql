INSERT INTO Artist (ArtistId, Name) VALUES (1,'Solo'),(2,'Quiet'),(3,'Seller');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Q1',2),(2,'S1',3);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (10,'QT',1,1,1000,0.99),(20,'ST',2,1,1000,0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,20,0.99,1);
