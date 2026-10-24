INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file'),(2,'Protected AAC audio file'),(3,'Unused');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES
(1,'a',1,100,5.00),(2,'b',2,100,1.00),(3,'c',2,100,2.00),(4,'d',2,100,0.99),(5,'e',2,100,0.99);
