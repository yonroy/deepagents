INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file'),(2,'Protected AAC audio file'),(3,'Protected MPEG-4 video file');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'T1',1,200000,0.99),(2,'T2',1,200000,0.99),(3,'T3',1,200000,0.99),(4,'T4',2,200000,0.99),(5,'T5',2,200000,0.99),(6,'T6',3,200000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'A','B','a@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2025-01-01 00:00:00',1.98),(2,1,'2025-02-01 00:00:00',0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,1,2,0.99,1),(3,2,1,0.99,1),(4,2,4,0.99,1);
