INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file'),(2,'Protected AAC audio file'),(3,'Protected MPEG-4 video file');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1000,0.99),(2,'t2',1,1000,0.99),(3,'t3',2,1000,0.99),(4,'t4',1,1000,0.99),(5,'t5',2,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'A','One','a@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2025-01-01 00:00:00',1.98),(2,1,'2025-01-02 00:00:00',2.97);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,1,1,0.99,1),(3,2,1,0.99,1),(4,2,3,0.99,1),(5,2,5,0.99,1);
