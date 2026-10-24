INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file'),(2,'Protected AAC audio file');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'T1',1,1000,0.99),(2,'T2',1,1000,1.00),(3,'T3',2,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'A','A','a@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2025-01-05 10:00:00',2.98),(2,1,'2025-02-05 10:00:00',0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,2),(2,1,2,1.00,1),(3,2,3,0.99,1);
