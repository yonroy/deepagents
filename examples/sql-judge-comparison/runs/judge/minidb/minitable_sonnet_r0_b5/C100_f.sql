INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal'),(4,'Pop'),(5,'Blues'),(6,'Classical');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'m');
INSERT INTO Track (TrackId, Name, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES
(1,'r1',1,1,60000,0.99),(2,'r2',1,1,190000,0.99),
(3,'j1',1,2,300000,0.99),
(4,'m1',1,3,90000,0.99),(5,'m2',1,3,90000,0.99),(6,'m3',1,3,90000,0.99),
(7,'p1',1,4,240000,0.99),(8,'p2',1,4,300000,0.99),
(9,'b1',1,5,100000,0.99),
(10,'n1',1,NULL,9000000,0.99);
