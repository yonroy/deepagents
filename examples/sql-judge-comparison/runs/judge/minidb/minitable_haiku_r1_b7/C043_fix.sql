INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file');
INSERT INTO Artist (ArtistId, Name) VALUES (1,'Iron Maiden'),(2,'Iron Maiden Covers');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Powerslave',1),(2,'Piece of Mind',1),(3,'Tribute Album',2);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'Aces High',1,1,1000,0.99),(2,'2 Minutes to Midnight',1,1,1000,0.99),(3,'Flight of Icarus',1,1,1000,0.99),(4,'Cover Song',3,1,1000,0.99);
