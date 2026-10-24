INSERT INTO Artist (ArtistId, Name) VALUES (1,'Iron Maiden'),(2,'Accept');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Powerslave',1),(2,'Somewhere in Time',1),(3,'Live After Death',1),(4,'Balls to the Wall',2);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'T1',1,1,1000,0.99),(2,'T2',1,1,1000,0.99),(3,'T3',1,1,1000,0.99),(4,'T4',2,1,1000,0.99),(5,'T5',2,1,1000,0.99),(6,'T6',4,1,1000,0.99);
