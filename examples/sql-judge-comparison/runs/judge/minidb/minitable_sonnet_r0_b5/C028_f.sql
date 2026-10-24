INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG'),(2,'AAC'),(3,'Video');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1000,0.99),(2,'t2',2,1000,1.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'a','a','a@x');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2021-01-01 00:00:00',2.98);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,1,2,1.99,1);
