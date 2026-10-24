INSERT INTO Artist (ArtistId, Name) VALUES (1,'Iron Maiden'),(2,'Other');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Powerslave',1),(2,'Piece of Mind',1),(3,'Empty',1),(4,'Else',2);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'m');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1,1000,0.99),(2,'t2',1,1,1000,0.99),(3,'t3',2,1,1000,0.99),(4,'t4',4,1,1000,0.99);
