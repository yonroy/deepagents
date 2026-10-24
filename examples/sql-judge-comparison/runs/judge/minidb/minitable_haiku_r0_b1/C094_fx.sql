INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES (1,'R1',1,1,1000,0.99),(2,'J1',1,2,1000,0.99),(3,'M1',1,3,1000,0.99),(4,'R2',1,1,1000,0.99),(5,'N1',1,NULL,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'A','A','a1@x.com'),(2,'B','B','b2@x.com'),(3,'C','C','c3@x.com'),(4,'D','D','d4@x.com'),(5,'E','E','e5@x.com'),(6,'F','F','f6@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-01-01 00:00:00',0.99),(2,1,'2024-02-01 00:00:00',0.99),(3,2,'2024-01-02 00:00:00',1.98),(4,3,'2024-01-03 00:00:00',1.98),(5,4,'2024-01-04 00:00:00',0.99),(6,4,'2024-01-05 00:00:00',0.99),(7,6,'2024-01-06 00:00:00',1.98);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,2,2,0.99,1),(3,3,1,0.99,1),(4,3,1,0.99,1),(5,4,2,0.99,1),(6,4,3,0.99,1),(7,5,4,0.99,1),(8,6,2,0.99,1),(9,7,4,0.99,1),(10,7,5,0.99,1);
