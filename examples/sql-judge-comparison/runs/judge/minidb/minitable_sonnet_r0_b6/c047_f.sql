INSERT INTO MediaType VALUES (1,'MPEG'),(2,'AAC'),(3,'Video');
INSERT INTO Track (TrackId,Name,AlbumId,MediaTypeId,GenreId,Composer,Milliseconds,Bytes,UnitPrice) VALUES (1,'a',NULL,1,NULL,NULL,1000,1,1.00),(2,'b',NULL,1,NULL,NULL,1000,1,1.00),(3,'c',NULL,2,NULL,NULL,1000,1,1.00),(4,'d',NULL,3,NULL,NULL,1000,1,5.00);
INSERT INTO InvoiceLine VALUES (1,1,1,1.00,2),(2,1,2,1.00,1),(3,2,3,1.00,1);
