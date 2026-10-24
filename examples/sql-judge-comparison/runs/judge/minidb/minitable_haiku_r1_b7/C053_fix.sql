INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file');
INSERT INTO Artist (ArtistId, Name) VALUES (1,'Artist A'),(2,'Artist B'),(3,'Artist C'),(4,'Artist D'),(5,'Artist E');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'AA',1),(2,'BB',2),(3,'DD1',4),(4,'DD2',4),(5,'EE',5);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'a1',1,1,1000,0.99),(2,'b1',2,1,1000,0.99),(3,'d1',3,1,1000,0.99),(4,'d2',4,1,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'X','Y','x@y.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-01-01 00:00:00',1.98);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,1,3,0.99,1);
