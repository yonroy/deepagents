INSERT INTO Artist (ArtistId, Name) VALUES (1,'Iron Maiden'),(2,'Iron Maiden Tribute'),(3,'Maiden Fans');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'Powerslave',1),(2,'Empty Album',1),(3,'Powerslave',2),(4,'Somewhere',1);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'T1',1,1,NULL,NULL,200000,NULL,0.99),
(2,'T2',1,1,NULL,NULL,200000,NULL,0.99),
(3,'T3',1,1,NULL,NULL,200000,NULL,0.99),
(4,'T4',3,1,NULL,NULL,200000,NULL,0.99),
(5,'T5',3,1,NULL,NULL,200000,NULL,0.99),
(6,'T6',4,1,NULL,NULL,200000,NULL,0.99),
(7,'T7',4,1,NULL,NULL,200000,NULL,0.99),
(8,'T8',4,1,NULL,NULL,200000,NULL,0.99),
(9,'T9',4,1,NULL,NULL,200000,NULL,0.99),
(10,'T10',NULL,1,NULL,NULL,200000,NULL,0.99);
