INSERT INTO Artist (ArtistId, Name) VALUES (1,'Iron Maiden'),(2,'Iron Maiden Tribute');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Killers',1),(2,'Powerslave',1),(3,'Tribute Album',2),(4,'Piece of Mind',1);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES (1,'k1',1,1,NULL,1000,0.99),(2,'k2',1,1,NULL,1000,0.99),(3,'k3',1,1,NULL,1000,0.99),(4,'t1',3,1,NULL,1000,0.99),(5,'t2',3,1,NULL,1000,0.99),(6,'p1',4,1,NULL,1000,0.99);
