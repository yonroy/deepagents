INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (2,'Leonie','Kohler','b@x.com');
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (3,'Francois','Tremblay','c@x.com');
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES (4,'Ulleval','Hansen','d@x.com');
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (1,2,'2024-12-31 10:00:00',5.00);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (2,2,'2025-01-15 00:00:00',1.98);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (3,4,'2025-01-31 23:59:59',3.96);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (4,3,'2025-03-10 08:00:00',5.94);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (5,3,'2025-12-31 23:59:59',10.00);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total) VALUES (6,3,'2026-01-01 00:00:00',7.00);
