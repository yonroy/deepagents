INSERT INTO Artist (ArtistId, Name) VALUES (1,'Iron Maiden'),(2,'Iron Maiden Tribute'),(3,'Other');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Powerslave',1),(2,'Empty Album',1),(3,'Dup',1),(4,'Dup',1),(5,'Tribute Album',2),(6,'Other Album',3);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'p1',1,1,1,NULL,1,1,0.99),(2,'p2',1,1,1,NULL,1,1,0.99),(3,'p3',1,1,1,NULL,1,1,0.99),
(4,'d1',3,1,1,NULL,1,1,0.99),
(5,'d2',4,1,1,NULL,1,1,0.99),(6,'d3',4,1,1,NULL,1,1,0.99),
(7,'x1',5,1,1,NULL,1,1,0.99),(8,'x2',6,1,1,NULL,1,1,0.99);
