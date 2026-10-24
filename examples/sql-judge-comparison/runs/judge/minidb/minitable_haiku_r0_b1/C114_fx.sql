INSERT INTO Artist (ArtistId, Name) VALUES (1,'Ar');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Al1',1),(2,'Al2',1),(3,'Al3',1),(4,'Al4',1),(5,'Al5',1);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Composer, Milliseconds, UnitPrice) VALUES (1,'a',1,1,'X',2000000,0.99),(2,'b',1,1,NULL,1000000,0.99),(3,'c',2,1,'Y',3000000,0.99),(4,'d',2,1,NULL,1000000,0.99),(5,'e',3,1,'Z',4000000,0.99),(6,'f',3,1,'W',100000,0.99),(7,'g',4,1,NULL,4000000,0.99),(8,'h',5,1,NULL,3600000,0.99);
