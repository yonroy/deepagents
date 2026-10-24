INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal');
INSERT INTO Track (TrackId, Name, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1,1000,0.99),(2,'t2',1,2,1000,0.99),(3,'t3',1,3,1000,0.99),(4,'t4',1,1,1000,0.99),(5,'t5',1,NULL,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'Ann','A','a@x.com'),(2,'Bob','B','b@x.com'),(3,'Cy','C','c@x.com'),(4,'Dee','D','d@x.com'),(5,'Eve','E','e@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2025-01-01 00:00:00',0.99),(2,1,'2025-01-02 00:00:00',0.99),(3,2,'2025-01-03 00:00:00',1.98),(4,3,'2025-01-04 00:00:00',1.98),(5,4,'2025-01-05 00:00:00',2.97),(6,5,'2025-01-06 00:00:00',1.98);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,2,2,0.99,1),(3,3,1,0.99,1),(4,3,4,0.99,1),(5,4,3,0.99,1),(6,4,2,0.99,1),(7,5,4,0.99,1),(8,5,2,0.99,1),(9,5,3,0.99,1),(10,6,2,0.99,1),(11,6,2,0.99,1);
