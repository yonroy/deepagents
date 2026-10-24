INSERT INTO Playlist (PlaylistId, Name) VALUES (1,'P1'),(2,'P2'),(3,'P3'),(4,'P4'),(5,'P5'),(6,'P6');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'Hit Song',1,1000,0.99),(2,'Hit Song',1,1000,0.99),(3,'Rare Song',1,1000,0.99),(4,'Four Song',1,1000,0.99),(5,'Five Song',1,1000,0.99);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,2),(1,3),(2,3),(1,4),(2,4),(3,4),(4,4),(1,5),(2,5),(3,5),(4,5),(5,5);
