INSERT INTO Genre (GenreId,Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal');
INSERT INTO Track (TrackId,Name,AlbumId,MediaTypeId,GenreId,Milliseconds,UnitPrice) VALUES (1,'r',1,1,1,1000,0.99),(2,'j',1,1,2,1000,0.99),(3,'m',1,1,3,1000,0.99);
INSERT INTO Invoice (InvoiceId,CustomerId,InvoiceDate,Total) VALUES (1,1,'2021-01-01',1),(2,2,'2021-01-01',1),(3,2,'2021-01-02',1),(4,3,'2021-01-01',1),(5,4,'2021-01-01',1);
INSERT INTO InvoiceLine (InvoiceLineId,InvoiceId,TrackId,UnitPrice,Quantity) VALUES (1,1,1,0.99,1),(2,2,1,0.99,1),(3,3,2,0.99,1),(4,4,2,0.99,1),(5,5,3,0.99,1);
