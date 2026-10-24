INSERT INTO Artist (ArtistId, Name) VALUES (1,'Sold1'),(2,'EmptyAlbum'),(3,'NoAlbum'),(4,'UnsoldTrack'),(5,'PartlySold'),(6,'Sold6');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'a1',1),(2,'a2',2),(3,'a3',4),(4,'a4',5),(5,'a5',5),(6,'a6',6);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'t1',1,1,1,NULL,1,1,0.99),
(3,'t3',3,1,1,NULL,1,1,0.99),
(4,'t4',4,1,1,NULL,1,1,0.99),
(5,'t5',5,1,1,NULL,1,1,0.99),
(6,'t6',6,1,1,NULL,1,1,0.99),
(7,'t7',6,1,1,NULL,1,1,0.99),
(8,'t8',NULL,1,1,NULL,1,1,0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,0.99,1),(2,1,4,0.99,1),(3,1,4,0.99,1),(4,1,6,0.99,1),(5,1,6,0.99,1),(6,1,8,0.99,1);
