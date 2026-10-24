INSERT INTO MediaType (MediaTypeId,Name) VALUES (1,'MPEG'),(2,'AAC');
INSERT INTO Track (TrackId,Name,AlbumId,MediaTypeId,GenreId,Milliseconds,UnitPrice) VALUES (1,'a',1,1,1,1000,0.99),(2,'b',1,1,1,1000,0.99),(3,'c',1,2,1,1000,0.99),(4,'d',1,2,1,1000,0.99);
INSERT INTO Invoice (InvoiceId,CustomerId,InvoiceDate,Total) VALUES (1,1,'2021-01-01',1),(2,2,'2021-01-01',1);
INSERT INTO InvoiceLine (InvoiceLineId,InvoiceId,TrackId,UnitPrice,Quantity) VALUES (1,1,1,0.99,1),(2,2,1,0.99,1),(3,1,2,0.99,1),(4,2,3,0.99,1);
