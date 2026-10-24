INSERT INTO Artist (ArtistId, Name) VALUES (1,'Artist A');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Al1',1),(2,'Al2',1),(3,'Al3',1),(4,'Al4',1);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, UnitPrice) VALUES (1,'t1',1,1,1,NULL,2000000,0.99),(2,'t2',1,1,1,'X',1700000,0.99),(3,'t3',2,1,1,'Y',1800000,0.99),(4,'t4',2,1,1,'Z',1900000,0.99),(5,'t5',3,1,1,NULL,3000000,0.99),(6,'t6',4,1,1,NULL,1800000,0.99),(7,'t7',4,1,1,'W',1800000,0.99);
