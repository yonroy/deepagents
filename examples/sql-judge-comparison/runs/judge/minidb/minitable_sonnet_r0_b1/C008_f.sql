INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'M1'),(2,'M2'),(3,'M3');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1,0.99),(2,'t2',1,1,0.99),(3,'t3',1,1,0.99),(4,'t4',2,1,0.99),(5,'t5',3,1,0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,2,1,0.99,1),(3,2,2,0.99,1),(4,3,4,0.99,1);
