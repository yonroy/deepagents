INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file'),(2,'Protected AAC audio file'),(3,'Protected MPEG-4 video file');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'T1',1,1000,0.99),(2,'T2',1,1000,0.99),(3,'T3',2,1000,0.99),(4,'T4',2,1000,0.99),(5,'T5',3,1000,0.99),(6,'T6',1,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'A','One','a1@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2025-01-05 00:00:00',2.97),(2,1,'2025-01-06 00:00:00',1.98);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,2),(2,1,2,0.99,1),(3,2,1,0.99,1),(4,2,3,0.99,1);
