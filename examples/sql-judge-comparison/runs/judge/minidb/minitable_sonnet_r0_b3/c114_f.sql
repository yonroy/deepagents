INSERT INTO MediaType (MediaTypeId,Name) VALUES (1,'MPEG');
INSERT INTO Track (TrackId,Name,AlbumId,MediaTypeId,Composer,Milliseconds,UnitPrice) VALUES
(1,'a1',1,1,NULL,1000000,0.99),
(2,'a2',1,1,'X',3000000,0.99),
(3,'b1',2,1,'X',4000000,0.99),
(4,'b2',2,1,'Y',1000000,0.99),
(5,'c1',3,1,NULL,4000000,0.99),
(6,'d1',4,1,NULL,1000000,0.99),
(7,'d2',4,1,'Z',1000000,0.99),
(8,'e1',5,1,NULL,3600000,0.99);
