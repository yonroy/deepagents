INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1000,0.99),(2,'t2',1,1000,0.99),(3,'t3',1,1000,0.99),(4,'t4',1,1000,0.99),(5,'t5',1,1000,0.99),(6,'t6',1,1000,0.99);
INSERT INTO Playlist (PlaylistId, Name) VALUES (1,'Grunge'),(2,'Grunge Classics'),(3,'grunge');
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(3,6);
