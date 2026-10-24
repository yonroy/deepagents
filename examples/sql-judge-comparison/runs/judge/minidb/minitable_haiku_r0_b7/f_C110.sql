INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal'),(4,'Blues');
INSERT INTO Track (TrackId, Name, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES (1,'r1',1,1,240000,0.99),(2,'r2',1,1,360000,0.99),(3,'j1',1,2,600000,0.99),(4,'m1',1,3,180000,0.99),(5,'m2',1,3,200000,0.99),(6,'b1',1,4,60000,0.99),(7,'x1',1,NULL,9999999,0.99);
