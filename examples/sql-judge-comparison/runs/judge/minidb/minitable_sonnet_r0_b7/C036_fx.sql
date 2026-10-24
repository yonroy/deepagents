INSERT INTO MediaType VALUES (1,'m');
INSERT INTO Playlist VALUES (1,'p1'),(2,'p2'),(3,'p3'),(4,'p4'),(5,'p5'),(6,'p6');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES
(1,'Five',1,1000,1),(2,'Four',1,1000,1),(3,'Six',1,1000,1),(4,'Dup',1,1000,1),(5,'Dup',1,1000,1),(6,'Lonely',1,1000,1);
INSERT INTO PlaylistTrack VALUES
(1,1),(2,1),(3,1),(4,1),(5,1),
(1,2),(2,2),(3,2),(4,2),
(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),
(1,4),(2,4),(3,4),
(4,5),(5,5),(6,5);
