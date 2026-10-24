INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG');
INSERT INTO Track (TrackId, Name, GenreId, MediaTypeId, Milliseconds, UnitPrice) VALUES
(1,'a',1,1,100,0.99),(2,'b',1,1,200,0.99),(3,'c',1,1,300,0.99),(4,'d',2,1,400,0.99),(5,'e',NULL,1,500,0.99);
