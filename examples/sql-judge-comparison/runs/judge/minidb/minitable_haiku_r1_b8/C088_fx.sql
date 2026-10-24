INSERT INTO Artist (ArtistId, Name) VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'al1',1),(2,'al2',3),(3,'al3',4),(4,'al4',4),(5,'al5',5);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'T1',1,1,1000,0.99),(2,'T2',2,1,1000,0.99),(3,'T3',3,1,1000,0.99),(4,'T4',4,1,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'A','B','ab@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-05-01 00:00:00',2.97);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,1,1,0.99,1),(3,1,3,0.99,1);
