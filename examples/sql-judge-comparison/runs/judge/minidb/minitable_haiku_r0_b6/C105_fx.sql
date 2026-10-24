INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Playlist (PlaylistId, Name) VALUES (1,'P1'),(2,'P2'),(3,'P3'),(4,'P4'),(5,'P5');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (1,'Intro',NULL,1,NULL,NULL,100000,NULL,0.99),(2,'Intro',NULL,1,NULL,NULL,100000,NULL,0.99),(3,'Balls to the Wall',NULL,1,NULL,NULL,300000,NULL,0.99);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3);
