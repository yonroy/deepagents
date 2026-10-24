INSERT INTO Artist (ArtistId,Name) VALUES (1,'A1'),(2,'A2'),(3,'A3'),(4,'A4'),(5,'A5');
INSERT INTO Album (AlbumId,Title,ArtistId) VALUES (1,'al1',1),(2,'al2',2),(3,'al3',3);
INSERT INTO Track (TrackId,Name,AlbumId,MediaTypeId,Milliseconds,UnitPrice) VALUES (1,'t1',1,1,1,1),(2,'t2',2,1,1,1);
INSERT INTO InvoiceLine (InvoiceLineId,InvoiceId,TrackId,UnitPrice,Quantity) VALUES (1,1,1,1,1);
