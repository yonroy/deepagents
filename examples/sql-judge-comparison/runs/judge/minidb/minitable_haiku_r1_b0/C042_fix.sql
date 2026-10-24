INSERT INTO Artist (ArtistId, Name) VALUES (1,'Iron Maiden'),(2,'Iron Maiden Tribute'),(3,'Other');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Powerslave',1),(2,'Piece of Mind',1),(3,'Killers',1),(4,'Tribute Album',2);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES
(1,'Aces High',1,1,1000,0.99),
(2,'Back in the Village',1,1,1000,0.99),
(3,'Flight of Icarus',1,1,1000,0.99),
(4,'Wrathchild',3,1,1000,0.99),
(5,'Murders',3,1,1000,0.99),
(6,'Tribute track',4,1,1000,0.99),
(7,'Loose track',NULL,1,1000,0.99);
