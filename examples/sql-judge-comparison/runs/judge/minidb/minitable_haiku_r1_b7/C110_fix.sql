INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file');
INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal'),(4,'Pop'),(5,'Blues');
INSERT INTO Track (TrackId, Name, GenreId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'R1',1,1,300000,0.99),(2,'R2',1,1,360000,0.99),(3,'J1',2,1,600000,0.99),(4,'M1',3,1,240000,0.99),(5,'M2',3,1,180000,0.99),(6,'P1',4,1,120000,0.99),(7,'N1',NULL,1,9999999,0.99);
