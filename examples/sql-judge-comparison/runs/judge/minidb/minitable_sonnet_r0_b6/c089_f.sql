INSERT INTO Genre VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal');
INSERT INTO Track (TrackId,Name,AlbumId,MediaTypeId,GenreId,Composer,Milliseconds,Bytes,UnitPrice) VALUES (1,'a',NULL,1,1,NULL,1000,1,1.00),(2,'b',NULL,1,1,NULL,1000,1,1.00),(3,'c',NULL,1,2,NULL,1000,1,5.00),(4,'d',NULL,1,3,NULL,1000,1,1.00);
INSERT INTO InvoiceLine VALUES (1,1,1,1.00,2),(2,1,2,1.00,2),(3,2,1,1.00,2),(4,2,3,5.00,1);
