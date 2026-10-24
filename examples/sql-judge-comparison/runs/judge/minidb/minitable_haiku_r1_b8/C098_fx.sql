INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock');
INSERT INTO Track (TrackId, Name, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES (1,'Hit A',1,1,1000,0.99),(2,'Hit B',1,1,1000,0.99),(3,'Hit C',1,1,1000,0.99),(4,'Same Name',1,1,1000,0.99),(5,'Same Name',1,1,1000,0.99);
INSERT INTO Playlist (PlaylistId, Name) VALUES (1,'P1'),(2,'P2'),(3,'P3'),(4,'P4'),(5,'P5'),(6,'P6');
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,5);
