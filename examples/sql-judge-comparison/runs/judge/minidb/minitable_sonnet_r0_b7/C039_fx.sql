INSERT INTO MediaType VALUES (1,'m');
INSERT INTO Genre VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'F'),(6,'Empty');
INSERT INTO Track (TrackId, Name, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES
(1,'a1',1,1,60000,1),(2,'a2',1,1,120000,1),
(3,'b1',1,2,300000,1),
(4,'c1',1,3,180000,1),(5,'c2',1,3,180000,1),(6,'c3',1,3,180000,1),
(7,'d1',1,4,100000,1),
(8,'f1',1,5,200000,1),(9,'f2',1,5,200001,1),
(10,'n1',1,NULL,900000,1);
