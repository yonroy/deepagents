INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (1,'Ann','A','c1@x.com');
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (2,'Bob','B','c2@x.com');
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (3,'Cy','C','c3@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,1,'2024-12-31 23:59:59',4.00);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (2,1,'2025-01-01 00:00:00',1.98);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (3,2,'2025-03-31 23:59:59',3.96);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (4,2,'2025-04-01 00:00:00',5.94);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (5,3,'2025-02-14 12:00:00',0.99);
