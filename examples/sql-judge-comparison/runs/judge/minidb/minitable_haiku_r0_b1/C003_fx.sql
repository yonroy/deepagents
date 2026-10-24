INSERT INTO Artist (ArtistId, Name) VALUES (1,'AC/DC'),(2,'Accept'),(3,'Aerosmith'),(4,'Queen');
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1,'A1',1),(2,'A2',2),(3,'A3',1),(4,'A4',3),(5,'A5',4);
INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file');
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'t1',1,1,1000,0.99),(2,'t2',2,1,1000,0.99),(3,'t3',3,1,1000,0.99),(4,'t4',4,1,1000,0.99),(5,'t5',5,1,1000,0.99),(6,'t6',NULL,1,1000,0.99);
INSERT INTO Customer (CustomerId, FirstName, LastName, Email, Country) VALUES (1,'G','One','g1@x.de','Germany'),(2,'A','Two','a2@x.at','Austria'),(3,'G','Three','g3@x.de','Germany');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-05-01 10:00:00',2.97),(2,1,'2024-12-31 23:59:59',3.96),(3,2,'2024-06-01 10:00:00',4.95),(4,3,'2024-07-01 10:00:00',4.95),(5,1,'2025-01-01 00:00:00',9.90),(6,3,'2023-12-31 10:00:00',19.80),(7,3,'2024-03-01 10:00:00',0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,1,2,0.99,2),(3,2,3,0.99,4),(4,3,4,0.99,5),(5,4,4,0.99,1),(6,4,5,0.99,4),(7,5,5,0.99,10),(8,6,2,0.99,20),(9,7,6,0.99,1);
