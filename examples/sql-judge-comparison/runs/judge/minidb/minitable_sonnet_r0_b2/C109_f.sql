INSERT INTO Genre (GenreId,Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal');
INSERT INTO MediaType (MediaTypeId,Name) VALUES (1,'MPEG');
INSERT INTO Track (TrackId,Name,AlbumId,MediaTypeId,GenreId,Milliseconds,UnitPrice) VALUES (1,'rock',NULL,1,1,1000,0.99),(2,'jazz',NULL,1,2,1000,0.99),(3,'metal',NULL,1,3,1000,0.99);
INSERT INTO Customer (CustomerId,FirstName,LastName,Email) VALUES (1,'A','A','a@x'),(2,'B','B','b@x'),(3,'C','C','c@x'),(4,'D','D','d@x'),(5,'E','E','e@x');
INSERT INTO Invoice (InvoiceId,CustomerId,InvoiceDate,Total) VALUES (1,1,'2023-01-01 00:00:00',2),(2,2,'2023-01-01 00:00:00',1),(3,3,'2023-01-01 00:00:00',1),(4,4,'2023-01-01 00:00:00',1),(5,4,'2023-01-02 00:00:00',1),(6,5,'2023-01-01 00:00:00',1),(7,5,'2023-01-02 00:00:00',1);
INSERT INTO InvoiceLine (InvoiceLineId,InvoiceId,TrackId,UnitPrice,Quantity) VALUES (1,1,1,0.99,1),(2,1,2,0.99,1),(3,2,1,0.99,1),(4,3,2,0.99,1),(5,4,3,0.99,1),(6,5,1,0.99,1),(7,6,1,0.99,1),(8,7,2,0.99,1);
