INSERT INTO Artist (ArtistId, Name) VALUES (1,'Seller'),(2,'NoSale'),(3,'NoAlbumA'),(4,'NoAlbumB');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'S1',1),(2,'N1',2);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'T1',1,1,1000,0.99),(2,'T2',2,1,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'C','One','c1@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-01-01 00:00:00',0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1);
