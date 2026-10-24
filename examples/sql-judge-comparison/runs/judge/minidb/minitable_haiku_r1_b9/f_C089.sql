INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal'),(4,'Blues'),(5,'Latin'),(6,'Pop'),(7,'Classical');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1,'T Rock',NULL,1,1,NULL,1000,NULL,0.99),
(2,'T Metal',NULL,1,3,NULL,1000,NULL,0.99),
(3,'T Jazz',NULL,1,2,NULL,1000,NULL,0.99),
(4,'T Latin',NULL,1,5,NULL,1000,NULL,0.99),
(5,'T Pop',NULL,1,6,NULL,1000,NULL,0.99),
(6,'T Blues',NULL,1,4,NULL,1000,NULL,0.99),
(7,'T Classical',NULL,1,7,NULL,1000,NULL,0.99),
(8,'T NoGenre',NULL,1,NULL,NULL,1000,NULL,0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,1.00,10),
(2,1,1,1.00,1),
(3,1,2,6.00,1),
(4,1,2,6.00,1),
(5,1,2,6.00,1),
(6,1,4,2.00,1),
(7,1,4,2.00,1),
(8,1,4,2.00,1),
(9,1,4,2.00,1),
(10,1,4,2.00,1),
(11,1,4,2.00,1),
(12,1,3,8.00,1),
(13,1,5,7.00,1),
(14,1,6,3.00,1),
(15,1,7,1.00,1),
(16,1,8,100.00,1);
