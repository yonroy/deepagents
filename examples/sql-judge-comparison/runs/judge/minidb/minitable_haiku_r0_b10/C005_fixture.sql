INSERT INTO Playlist (PlaylistId, Name) VALUES (1,'Music'),(2,'Grunge'),(3,'Jazz');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'T1',1,1000,0.99),(2,'T2',1,1000,0.99),(3,'T3',1,1000,0.99),(4,'T4',1,1000,0.99),(5,'T5',1,1000,0.99),(6,'T6',1,1000,0.99);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(3,6);
