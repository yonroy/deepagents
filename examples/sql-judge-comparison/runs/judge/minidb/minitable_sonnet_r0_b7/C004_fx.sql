INSERT INTO MediaType VALUES (1,'m');
INSERT INTO Playlist VALUES (1,'Music'),(2,'Music'),(3,'Movies');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES
(1,'a',1,1000,1),(2,'b',1,1000,1),(3,'c',1,1000,1),(4,'d',1,1000,1);
INSERT INTO PlaylistTrack VALUES (1,1),(1,2),(2,1),(2,3),(3,4),(3,1);
