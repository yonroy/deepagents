INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'a',1,200000,0.99),(2,'b',1,200000,0.99),(3,'c',1,200000,0.99),(4,'d',1,200000,0.99),(5,'e',1,200000,0.99);
INSERT INTO Playlist (PlaylistId, Name) VALUES (1,'Grunge'),(2,'grunge'),(3,'Grunge Classics');
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4);
