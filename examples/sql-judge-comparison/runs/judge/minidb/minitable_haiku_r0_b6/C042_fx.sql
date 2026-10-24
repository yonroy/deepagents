INSERT INTO Artist (ArtistId, Name) VALUES (10,'Iron Maiden'),(11,'Iron Maiden Tribute');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (20,'Powerslave',10),(21,'Empty Album',10),(22,'Tribute Album',11),(23,'Killers',10);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (1,'Aces High',20,1,NULL,NULL,200000,NULL,0.99),(2,'2 Minutes',20,1,NULL,NULL,200000,NULL,0.99),(3,'Icarus',20,1,NULL,NULL,200000,NULL,0.99),(4,'Other 1',22,1,NULL,NULL,200000,NULL,0.99),(5,'Other 2',22,1,NULL,NULL,200000,NULL,0.99),(6,'Killers Song',23,1,NULL,NULL,200000,NULL,0.99);
