INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'Ann','Lee','ann@x.com');
INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal'),(4,'Pop'),(5,'Blues'),(6,'Folk');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1,200000,0.99),(2,'t2',1,2,200000,1.99),(3,'t3',1,3,200000,0.99),(4,'t4',1,4,200000,0.50),(5,'t5',1,5,200000,0.99),(6,'t6',1,6,200000,0.50);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-01-01 00:00:00',22.88),(2,1,'2024-02-01 00:00:00',4.94),(3,1,'2024-03-01 00:00:00',1.49);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,1,1,0.99,1),(3,1,2,1.99,10),(4,2,3,0.99,1),(5,2,3,0.99,1),(6,2,3,0.99,1),(7,2,4,0.50,2),(8,3,5,0.99,1),(9,3,6,0.50,1);
