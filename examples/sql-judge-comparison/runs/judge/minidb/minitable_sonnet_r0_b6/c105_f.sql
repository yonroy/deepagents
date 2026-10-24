INSERT INTO Playlist VALUES (1,'p1'),(2,'p2'),(3,'p3'),(4,'p4'),(5,'p5'),(6,'p6');
INSERT INTO Track (TrackId,Name,AlbumId,MediaTypeId,GenreId,Composer,Milliseconds,Bytes,UnitPrice) VALUES (1,'Dup',NULL,1,NULL,NULL,1000,1,1),(2,'Dup',NULL,1,NULL,NULL,1000,1,1),(3,'Five',NULL,1,NULL,NULL,1000,1,1),(4,'Four',NULL,1,NULL,NULL,1000,1,1);
INSERT INTO PlaylistTrack VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(6,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4);
