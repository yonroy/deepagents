INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'T1',NULL,1,NULL,NULL,1000,NULL,0.99),
(2,'T2',NULL,1,NULL,NULL,1000,NULL,0.99),
(3,'T3',NULL,1,NULL,NULL,1000,NULL,0.99),
(4,'T4',NULL,1,NULL,NULL,1000,NULL,0.99),
(5,'T5',NULL,1,NULL,NULL,1000,NULL,0.99),
(6,'T6',NULL,1,NULL,NULL,1000,NULL,0.99);
INSERT INTO Playlist (PlaylistId, Name) VALUES (1,'Grunge'),(2,'Grunge 2'),(3,'grunge'),(4,'Empty');
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(3,6);
