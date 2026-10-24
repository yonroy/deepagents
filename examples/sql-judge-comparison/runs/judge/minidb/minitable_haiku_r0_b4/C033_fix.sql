INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (10,'t10',1,200000,0.99),(11,'t11',1,200000,0.99),(12,'t12',1,200000,0.99),(13,'t13',1,200000,0.99);
INSERT INTO Playlist (PlaylistId, Name) VALUES (1,'Music'),(2,'Movies'),(3,'Music');
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (1,10),(1,11),(3,11),(3,12),(2,13),(2,10);
