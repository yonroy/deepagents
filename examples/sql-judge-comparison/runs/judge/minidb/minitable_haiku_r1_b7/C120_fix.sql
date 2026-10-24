INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file');
INSERT INTO Playlist (PlaylistId, Name) VALUES (1,'Music'),(2,'Music'),(3,'Movies'),(4,'Music');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (10,'S10',1,1000,0.99),(11,'S11',1,1000,0.99),(12,'S12',1,1000,0.99),(13,'S13',1,1000,0.99),(14,'S14',1,1000,0.99);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (1,10),(1,11),(1,12),(2,11),(2,13),(3,14),(3,10);
