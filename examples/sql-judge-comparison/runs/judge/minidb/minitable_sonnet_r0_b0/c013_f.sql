INSERT INTO Genre (GenreId,Name) VALUES (1,'G1'),(2,'G2'),(3,'G3'),(4,'G4'),(5,'G5'),(6,'G6'),(7,'G7');
INSERT INTO Track (TrackId,Name,GenreId,MediaTypeId,Milliseconds,UnitPrice) VALUES (1,'t1',1,1,1,1),(2,'t2',2,1,1,1),(3,'t3',3,1,1,1),(4,'t4',4,1,1,1),(5,'t5',5,1,1,1),(6,'t6',6,1,1,1),(7,'t7',7,1,1,1),(8,'t8',NULL,1,1,1);
INSERT INTO InvoiceLine (InvoiceLineId,InvoiceId,TrackId,UnitPrice,Quantity) VALUES (1,1,1,5,2),(2,1,2,0.99,1),(3,1,3,3,1),(4,1,4,8,1),(5,1,5,2,1),(6,1,6,6,1),(7,1,7,4,1),(8,1,8,50,1);
