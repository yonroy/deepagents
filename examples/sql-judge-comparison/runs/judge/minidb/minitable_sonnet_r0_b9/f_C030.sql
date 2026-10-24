INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'m');
INSERT INTO Genre (GenreId, Name) VALUES (1,'G1'),(2,'G2'),(3,'G3'),(4,'G4'),(5,'G5empty');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES
 (1,'a',NULL,1,1,100000,0.99),(2,'b',NULL,1,1,200001,0.99),
 (3,'c',NULL,1,2,300000,0.99),
 (4,'d',NULL,1,3,90000,0.99),(5,'e',NULL,1,3,90000,0.99),(6,'f',NULL,1,3,90000,0.99),
 (7,'g',NULL,1,4,200000,0.99),(8,'h',NULL,1,4,250001,0.99),
 (9,'i',NULL,1,NULL,9999999,0.99);
