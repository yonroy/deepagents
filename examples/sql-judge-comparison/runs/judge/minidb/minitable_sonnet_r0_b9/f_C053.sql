INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'m');
INSERT INTO Artist (ArtistId, Name) VALUES (1,'Sold'),(2,'UnsoldTrack'),(3,'NoAlbum'),(4,'AlbumNoTracks'),(5,'MixedSold');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'a1',1),(2,'a2',2),(3,'a3',4),(4,'a4',5);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES
 (1,'t1',1,1,NULL,1000,0.99),(2,'t2',2,1,NULL,1000,0.99),(3,'t3',4,1,NULL,1000,0.99),(4,'t4',4,1,NULL,1000,0.99),(5,'t5',NULL,1,NULL,1000,0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,1,1,0.99,1),(3,1,3,0.99,1),(4,1,5,0.99,1);
