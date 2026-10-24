INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock');
INSERT INTO Artist (ArtistId, Name) VALUES (1,'AC/DC'),(2,'Accept');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'A1',1),(2,'A2',1),(3,'A3',2),(4,'A4',2),(5,'A5',2);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, UnitPrice) VALUES
(1,'t1',1,1,1,NULL,2000000,0.99),
(2,'t2',1,1,1,'X',2000000,0.99),
(3,'t3',2,1,1,NULL,1000000,0.99),
(4,'t4',2,1,1,'Y',1000000,0.99),
(5,'t5',3,1,1,'Z',4000000,0.99),
(6,'t6',4,1,1,NULL,3000000,0.99),
(7,'t7',4,1,1,'W',1000000,0.99),
(8,'t8',5,1,1,NULL,3700000,0.99);
