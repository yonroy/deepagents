INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'m');
INSERT INTO Playlist (PlaylistId, Name) VALUES (1,'Grunge'),(2,'Music'),(3,'Empty');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES
 (1,'a',NULL,1,NULL,1000,0.99),(2,'b',NULL,1,NULL,1000,0.99),(3,'c',NULL,1,NULL,1000,0.99);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (1,1),(1,2),(2,1),(2,2),(2,3);
