INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal'),(4,'Pop'),(5,'Blues'),(6,'Latin');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES
(1,'T1',NULL,1,1,1000,0.99),(2,'T2',NULL,1,2,1000,0.99),(3,'T3',NULL,1,3,1000,0.99),
(4,'T4',NULL,1,4,1000,0.99),(5,'T5',NULL,1,5,1000,0.99),(6,'T6',NULL,1,6,1000,0.99),(7,'T7',NULL,1,NULL,1000,9.00);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,1.00,3),(2,1,1,1.00,1),(3,1,2,5.00,1),(4,1,3,0.99,2),(5,1,4,0.99,1),(6,1,5,2.00,1),(7,1,6,0.50,2),(8,1,7,9.00,1);
