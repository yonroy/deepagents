INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal'),(4,'Blues'),(5,'Classical');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES (1,'R1',1,1,300000,0.99),(2,'R2',1,1,120000,0.99),(3,'M1',1,3,600000,0.99),(4,'M2',1,3,600000,0.99),(5,'M3',1,3,600000,0.99),(6,'M4',1,3,420000,0.99),(7,'J1',1,2,240000,0.99),(8,'J2',1,2,150000,0.99),(9,'J3',1,2,100000,0.99),(10,'C1',1,5,1200000,0.99),(11,'C2',1,5,600000,0.99),(12,'B1',1,4,450000,0.99),(13,'N1',1,NULL,9999999,0.99);
