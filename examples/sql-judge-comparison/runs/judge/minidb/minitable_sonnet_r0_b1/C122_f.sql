INSERT INTO Artist (ArtistId, Name) VALUES (1,'X');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'M');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'A1',1),(2,'A2',1),(3,'A3',1),(4,'A4',1),(5,'A5',1),(6,'A6',1);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Composer, Milliseconds, UnitPrice) VALUES
(1,'t1',1,1,'c',2000000,0.99),(2,'t2',1,1,NULL,2000000,0.99),
(3,'t3',2,1,'c',2000000,0.99),(4,'t4',2,1,'c',2000000,0.99),
(5,'t5',3,1,'c',1800000,0.99),(6,'t6',3,1,NULL,1800000,0.99),
(7,'t7',4,1,'',5000000,0.99),
(8,'t8',5,1,NULL,1000000,0.99),
(9,'t9',6,1,NULL,3600001,0.99),
(10,'t10',NULL,1,NULL,9000000,0.99);
