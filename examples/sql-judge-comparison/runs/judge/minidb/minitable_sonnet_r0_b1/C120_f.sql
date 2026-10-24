INSERT INTO Playlist (PlaylistId, Name) VALUES (1,'Music'),(2,'Music'),(3,'Movies'),(4,'Other');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'M');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (10,'a',1,1,0.99),(11,'b',1,1,0.99),(12,'c',1,1,0.99),(13,'d',1,1,0.99);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (1,10),(1,11),(2,10),(2,12),(3,13),(3,10),(4,13);
