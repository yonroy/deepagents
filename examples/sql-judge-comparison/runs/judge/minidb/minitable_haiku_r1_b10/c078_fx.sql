INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal'),(4,'Pop');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES
(1,'T1',1,1,200000,0.99),
(2,'T2',1,1,200000,0.99),
(3,'T3',1,2,200000,0.99),
(4,'T4',1,NULL,200000,0.99),
(5,'T5',1,3,200000,0.99);
