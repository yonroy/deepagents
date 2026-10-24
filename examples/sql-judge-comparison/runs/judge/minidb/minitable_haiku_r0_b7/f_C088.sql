INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'Ann','Lee','ann@x.com');
INSERT INTO Artist (ArtistId, Name) VALUES (1,'Sold'),(2,'Unsold'),(3,'NoAlbum'),(4,'PartlySold'),(5,'Mixed');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'S1',1),(2,'U1',2),(3,'PS1',4),(4,'M1',5),(5,'M2',5);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1,200000,0.99),(2,'t2',2,1,200000,0.99),(3,'t3',3,1,200000,0.99),(4,'t4',3,1,200000,0.99),(5,'t5',4,1,200000,0.99),(6,'t6',5,1,200000,0.99);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-01-01 00:00:00',2.97);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,1,3,0.99,1),(3,1,6,0.99,1);
