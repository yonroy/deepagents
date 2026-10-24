INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'M1'),(2,'M2'),(3,'M3unsold');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES
 (1,'a',NULL,1,NULL,1000,5.00),(2,'b',NULL,1,NULL,1000,5.00),(3,'c',NULL,2,NULL,1000,5.00),(4,'d',NULL,2,NULL,1000,5.00),(5,'e',NULL,3,NULL,1000,5.00);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
 (1,1,1,1.00,2),(2,1,2,0.99,1),(3,1,3,0.99,1),(4,1,4,1.99,1);
