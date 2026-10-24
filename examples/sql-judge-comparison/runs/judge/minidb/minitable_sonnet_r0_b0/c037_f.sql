INSERT INTO Genre (GenreId,Name) VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal');
INSERT INTO Track (TrackId,Name,GenreId,MediaTypeId,Milliseconds,UnitPrice) VALUES (1,'r1',1,1,1000,0.99),(2,'j1',2,1,1000,0.99),(3,'m1',3,1,1000,0.99),(4,'r2',1,1,1000,0.99),(5,'j2',2,1,1000,0.99);
INSERT INTO Customer (CustomerId,FirstName,LastName,Email) VALUES (1,'A','A','a'),(2,'B','B','b'),(3,'C','C','c'),(4,'D','D','d'),(5,'E','E','e'),(6,'F','F','f'),(7,'G','G','g');
INSERT INTO Invoice (InvoiceId,CustomerId,InvoiceDate,Total) VALUES (1,1,'2023-01-01',1),(2,2,'2023-01-01',1),(3,3,'2023-01-01',1),(4,3,'2023-01-02',1),(5,4,'2023-01-01',2),(6,5,'2023-01-01',1),(7,6,'2023-01-01',1),(8,6,'2023-01-02',1);
INSERT INTO InvoiceLine (InvoiceLineId,InvoiceId,TrackId,UnitPrice,Quantity) VALUES (1,1,1,0.99,1),(2,2,2,0.99,1),(3,3,1,0.99,1),(4,4,2,0.99,1),(5,5,4,0.99,1),(6,5,5,0.99,1),(7,6,3,0.99,1),(8,7,1,0.99,1),(9,8,4,0.99,1);
