INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal'),(4,'Pop'),(5,'Classical');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (1,'R1',NULL,1,1,NULL,240000,NULL,0.99),(2,'R2',NULL,1,1,NULL,360000,NULL,0.99),(3,'J1',NULL,1,2,NULL,600000,NULL,0.99),(4,'M1',NULL,1,3,NULL,420000,NULL,0.99),(5,'M2',NULL,1,3,NULL,480000,NULL,0.99),(6,'P1',NULL,1,4,NULL,180000,NULL,0.99),(7,'N1',NULL,1,NULL,NULL,9000000,NULL,0.99);
