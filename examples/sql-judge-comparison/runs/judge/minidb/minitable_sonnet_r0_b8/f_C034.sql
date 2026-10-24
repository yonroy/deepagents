INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'Song A',1,1,1,NULL,1000,1000,0.99),
(2,'Song B',1,1,1,NULL,1000,1000,0.99),
(3,'Song C',1,1,1,NULL,1000,1000,0.99),
(4,'Song A',1,1,1,NULL,1000,1000,0.99);
INSERT INTO Playlist (PlaylistId, Name) VALUES (1,'p1'),(2,'p2'),(3,'p3'),(4,'p4'),(5,'p5'),(6,'p6');
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES
(1,1),(2,1),(3,1),(4,1),(5,1),
(1,2),(2,2),(3,2),(4,2),
(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),
(1,4),(2,4),(3,4),(4,4);
