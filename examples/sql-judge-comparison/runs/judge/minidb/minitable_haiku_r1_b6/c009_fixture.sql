INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal'),(4,'Blues'),(5,'Latin'),(6,'Pop');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES (1,'T1',1,1,200000,0.99),(2,'T2',1,2,200000,0.99),(3,'T3',1,3,200000,0.99),(4,'T4',1,4,200000,0.99),(5,'T5',1,5,200000,0.99),(6,'T6',1,6,200000,0.99),(7,'T7',1,NULL,200000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'Ann','Lee','ann@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-01-01 00:00:00',5.00),(2,1,'2024-02-01 00:00:00',1.00),(3,1,'2024-03-01 00:00:00',8.25),(4,1,'2024-04-01 00:00:00',3.00);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,1.00,3),(2,1,2,2.00,1),(3,2,3,0.50,2),(4,2,4,1.50,1),(5,3,5,1.25,1),(6,3,6,2.00,2),(7,3,7,5.00,1),(8,4,1,1.00,1),(9,4,6,2.00,1);
