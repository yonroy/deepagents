INSERT INTO Genre (GenreId, Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal');
INSERT INTO Track (TrackId, Name, MediaTypeId, GenreId, Milliseconds, UnitPrice) VALUES (1,'r',1,1,1,0.99),(2,'j',1,2,1,0.99),(3,'m',1,3,1,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'A','A','a'),(2,'B','B','b'),(3,'C','C','c'),(4,'D','D','d'),(5,'E','E','e');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2021-01-01',1),(2,2,'2021-01-01',1),(3,2,'2021-01-02',1),(4,3,'2021-01-01',1),(5,4,'2021-01-01',1),(6,4,'2021-01-02',1),(7,5,'2021-01-01',1),(8,5,'2021-01-02',1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1,1,1,0.99,1),(2,1,2,0.99,1),
(3,2,1,0.99,1),(4,3,1,0.99,1),
(5,4,2,0.99,1),(6,4,3,0.99,1),
(7,5,1,0.99,1),(8,5,3,0.99,1),(9,6,2,0.99,1),
(10,7,1,0.99,1),(11,7,1,0.99,1),(12,8,2,0.99,1);
