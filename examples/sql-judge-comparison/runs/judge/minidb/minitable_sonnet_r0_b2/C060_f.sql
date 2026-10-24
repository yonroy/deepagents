INSERT INTO MediaType (MediaTypeId,Name) VALUES (1,'MPEG'),(2,'AAC'),(3,'Video');
INSERT INTO Track (TrackId,Name,AlbumId,MediaTypeId,Milliseconds,UnitPrice) VALUES (1,'t1',NULL,1,1000,0.99),(2,'t2',NULL,1,1000,0.99),(3,'t3',NULL,2,1000,0.99),(4,'t4',NULL,2,1000,0.99),(5,'t5',NULL,3,1000,0.99);
INSERT INTO Customer (CustomerId,FirstName,LastName,Email) VALUES (1,'A','A','a@x');
INSERT INTO Invoice (InvoiceId,CustomerId,InvoiceDate,Total) VALUES (1,1,'2023-01-01 00:00:00',5.0),(2,1,'2023-01-02 00:00:00',1.0);
INSERT INTO InvoiceLine (InvoiceLineId,InvoiceId,TrackId,UnitPrice,Quantity) VALUES (1,1,1,0.99,1),(2,2,1,0.99,1),(3,1,2,0.99,1),(4,1,3,0.99,1);
