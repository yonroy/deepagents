INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file');
INSERT INTO Playlist (PlaylistId, Name) VALUES (1,'Grunge'),(2,'Grunge Essentials'),(3,'Rock');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'S1',1,1000,0.99),(2,'S2',1,1000,0.99),(3,'S3',1,1000,0.99),(4,'S4',1,1000,0.99);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (1,1),(1,2),(1,3),(2,1),(2,4),(3,2);
