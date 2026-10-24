INSERT INTO Artist (ArtistId, Name) VALUES (1,'Sold1'),(2,'AlbumUnsold'),(3,'NoAlbum'),(4,'AlbumNoTracks'),(5,'Sold2');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'a1',1),(2,'a2',2),(4,'a4',4),(5,'a5',5);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'m');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1,1000,0.99),(2,'t2',2,1,1000,0.99),(5,'t5',5,1,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'a','a','a@x');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2021-01-01 00:00:00',1.98);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,1,5,0.99,1);
