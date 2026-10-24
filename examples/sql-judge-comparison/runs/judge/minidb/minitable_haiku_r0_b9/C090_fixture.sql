INSERT INTO Artist (ArtistId, Name) VALUES (1,'Alpha'),(2,'Beta'),(3,'Gamma'),(4,'Delta');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Album B',2),(2,'Album G',3),(3,'Album D',4);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES (1,'tB1',1,1,NULL,1000,0.99),(2,'tG1',2,1,NULL,1000,0.99),(3,'tD1',3,1,NULL,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'X','Y','x@y.z');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-01-01 00:00:00',1.98);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,2,0.99,1),(2,1,3,0.99,1);
