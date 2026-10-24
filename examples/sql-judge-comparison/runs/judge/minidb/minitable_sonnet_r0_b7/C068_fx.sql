INSERT INTO MediaType VALUES (1,'m');
INSERT INTO Genre VALUES (1,'G1'),(2,'G2'),(3,'G3'),(4,'G4'),(5,'G5'),(6,'G6'),(7,'G7');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES
(1,'t1',NULL,1,1,1000,1.00),(2,'t2',NULL,1,2,1000,1.00),(3,'t3',NULL,1,3,1000,1.00),(4,'t4',NULL,1,4,1000,1.00),
(5,'t5',NULL,1,5,1000,1.00),(6,'t6',NULL,1,6,1000,1.00),(7,'t7',NULL,1,7,1000,1.00),(8,'t8',NULL,1,NULL,1000,1.00);
INSERT INTO InvoiceLine VALUES
(1,1,1,1.00,5),(2,1,2,3.00,1),(3,1,3,1.00,4),(4,2,4,1.00,1),(5,2,4,1.00,1),(6,2,5,1.50,1),(7,3,6,1.00,1),(8,3,8,100.00,1);
