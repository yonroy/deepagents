INSERT INTO Customer (CustomerId, FirstName, LastName, Country, Email) VALUES
(1,'Ann','One','X','a'),(2,'Bob','Two','X','b'),(3,'Cy','Three','Y','c'),(4,'Di','Four','Y','d'),(5,'Ed','Five','Z','e'),(6,'Ann','One','Y','f');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES
(1,1,'2021-01-01 00:00:00',60),(2,1,'2022-01-01 00:00:00',40),(3,2,'2021-01-01 00:00:00',100),
(4,3,'2021-01-01 00:00:00',50),(5,4,'2021-01-01 00:00:00',30),(6,6,'2021-01-01 00:00:00',20);
