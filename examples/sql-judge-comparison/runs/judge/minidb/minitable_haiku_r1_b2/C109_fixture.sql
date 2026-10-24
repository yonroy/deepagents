INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal');
INSERT INTO Track (TrackId, Name, GenreId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'Rock Song',1,1,1000,0.99),(2,'Jazz Song',2,1,1000,0.99),(3,'Metal Song',3,1,1000,0.99);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-01-01 00:00:00',0.99),(2,2,'2024-01-02 00:00:00',0.99),(3,3,'2024-01-03 00:00:00',0.99),(4,3,'2024-01-04 00:00:00',0.99),(5,4,'2024-01-05 00:00:00',0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,2,2,0.99,1),(3,3,1,0.99,1),(4,4,2,0.99,1),(5,5,3,0.99,1);
