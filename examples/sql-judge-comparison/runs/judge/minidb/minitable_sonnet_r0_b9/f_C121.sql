INSERT INTO Customer (CustomerId, FirstName, LastName, Country, Email) VALUES
 (1,'A1','X','Aland','a1@x'),(2,'A2','X','Aland','a2@x'),(3,'B1','X','Bland','b1@x'),(4,'B2','X','Bland','b2@x'),(5,'C1','X','Cland','c1@x'),(6,'C2','X','Cland','c2@x');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
 (1,1,'2021-01-01 00:00:00',10.00),(2,1,'2021-02-01 00:00:00',5.00),
 (3,2,'2021-01-01 00:00:00',8.00),
 (4,3,'2021-01-01 00:00:00',7.00),
 (5,4,'2021-01-01 00:00:00',3.00),
 (6,5,'2021-01-01 00:00:00',4.00),
 (7,6,'2021-01-01 00:00:00',4.00);
