INSERT INTO Artist (ArtistId, Name) VALUES (1,'Iron Maiden'),(2,'Iron Maiden Tribute'),(3,'Accept');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Powerslave',1),(2,'Somewhere in Time',1),(3,'Empty Album',1),(4,'Tribute Album',2),(5,'Accept LP',3);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'P1',1,1,1000,0.99),(2,'P2',1,1,1000,0.99),(3,'P3',1,1,1000,0.99),(4,'S1',2,1,1000,0.99),(5,'TR1',4,1,1000,0.99),(6,'A1',5,1,1000,0.99),(7,'Orphan',NULL,1,1000,0.99);
