INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file'),(2,'Protected AAC audio file'),(3,'Protected MPEG-4 video file');
INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock');
INSERT INTO Artist (ArtistId, Name) VALUES (1,'Artist A');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Album 1',1);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (1,'T1',1,1,1,NULL,300000,NULL,0.99),(2,'T2',1,1,1,NULL,300000,NULL,0.99),(3,'T3',1,2,1,NULL,300000,NULL,0.99),(4,'T4',1,2,1,NULL,300000,NULL,0.99),(5,'T5',1,1,1,NULL,300000,NULL,0.99),(6,'T6',1,3,1,NULL,300000,NULL,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'A','B','a@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2025-01-01 00:00:00',1.98),(2,1,'2025-02-01 00:00:00',0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,1,1,0.99,1),(3,2,1,0.99,1),(4,1,3,0.99,1),(5,2,2,0.99,1);
