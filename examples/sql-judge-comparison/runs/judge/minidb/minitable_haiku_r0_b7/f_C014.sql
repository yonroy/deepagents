INSERT INTO Artist (ArtistId, Name) VALUES (1,'Iron Maiden'),(2,'Judas Priest');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Powerslave',1),(2,'Piece of Mind',1),(3,'Empty Box',1),(4,'Defenders',2);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1,200000,0.99),(2,'t2',1,1,200000,0.99),(3,'t3',1,1,200000,0.99),(4,'t4',2,1,200000,0.99),(5,'t5',2,1,200000,0.99),(6,'t6',4,1,200000,0.99),(7,'t7',4,1,200000,0.99),(8,'t8',4,1,200000,0.99),(9,'t9',4,1,200000,0.99);
