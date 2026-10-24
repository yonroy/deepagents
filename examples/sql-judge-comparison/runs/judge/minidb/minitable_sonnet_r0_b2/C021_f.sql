INSERT INTO MediaType (MediaTypeId,Name) VALUES (1,'MPEG');
INSERT INTO Track (TrackId,Name,AlbumId,MediaTypeId,Composer,Milliseconds,UnitPrice) VALUES
(1,'t1',1,1,'x',2000000,0.99),
(2,'t2',1,1,NULL,1700000,0.99),
(3,'t3',2,1,'x',1800000,0.99),
(4,'t4',2,1,NULL,1800000,0.99),
(5,'t5',3,1,'x',4000000,0.99),
(6,'t6',4,1,NULL,4000000,0.99),
(7,'t7',NULL,1,NULL,5000000,0.99);
