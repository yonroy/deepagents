INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal');
INSERT INTO Track (TrackId, Name, GenreId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'r',1,1,1000,0.99),(2,'j',2,1,1000,0.99),(3,'m',3,1,1000,0.99),(4,'n',NULL,1,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'A','One','a1@x.com'),(2,'B','Two','b2@x.com'),(3,'C','Three','c3@x.com'),(4,'D','Four','d4@x.com'),(5,'E','Five','e5@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2025-01-01 00:00:00',0.99),(2,1,'2025-01-02 00:00:00',0.99),(3,2,'2025-01-03 00:00:00',1.98),(4,3,'2025-01-04 00:00:00',0.99),(5,4,'2025-01-05 00:00:00',0.99),(6,3,'2025-01-06 00:00:00',0.99),(7,5,'2025-01-07 00:00:00',0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,2,2,0.99,1),(3,3,1,0.99,1),(4,3,2,0.99,1),(5,4,1,0.99,1),(6,5,2,0.99,1),(7,6,3,0.99,1),(8,7,4,0.99,1);
