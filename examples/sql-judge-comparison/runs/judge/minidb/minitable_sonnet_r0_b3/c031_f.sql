INSERT INTO MediaType (MediaTypeId,Name) VALUES (1,'MPEG');
INSERT INTO Playlist (PlaylistId,Name) VALUES (1,'Music'),(2,'Grunge'),(3,'grunge2'),(4,'Empty');
INSERT INTO Track (TrackId,Name,MediaTypeId,Milliseconds,UnitPrice) VALUES (1,'t1',1,1,1),(2,'t2',1,1,1),(3,'t3',1,1,1),(4,'t4',1,1,1);
INSERT INTO PlaylistTrack (PlaylistId,TrackId) VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(3,4);
