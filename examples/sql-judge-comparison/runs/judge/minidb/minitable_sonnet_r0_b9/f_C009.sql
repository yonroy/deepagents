INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'m');
INSERT INTO Genre (GenreId, Name) VALUES (1,'G1'),(2,'G2'),(3,'G3'),(4,'G4'),(5,'G5'),(6,'G6'),(7,'G7');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES
 (1,'t1',NULL,1,1,1000,9.99),(2,'t2',NULL,1,2,1000,0.99),(3,'t3',NULL,1,3,1000,0.99),(4,'t4',NULL,1,4,1000,0.99),
 (5,'t5',NULL,1,5,1000,0.99),(6,'t6',NULL,1,6,1000,0.99),(7,'t7',NULL,1,7,1000,0.99),(8,'t8',NULL,1,NULL,1000,0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
 (1,1,1,1.00,3),(2,1,1,1.00,1),(3,1,2,2.50,2),(4,1,3,1.00,1),(5,1,4,3.00,1),(6,1,5,0.75,2),(7,1,6,0.99,1),(8,1,8,100.00,1);
