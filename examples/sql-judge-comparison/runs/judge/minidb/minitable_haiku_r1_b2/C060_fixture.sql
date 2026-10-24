INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file'),(2,'Protected AAC audio file'),(3,'Protected MPEG-4 video file');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES (1,'Sold Twice',1,1000,0.99),(2,'Sold Once',1,1000,0.99),(3,'AAC Sold',2,1000,0.99),(4,'AAC Unsold',2,1000,0.99),(5,'Video Unsold',3,1000,0.99);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1,1,1,0.99,1),(2,2,1,0.99,1),(3,3,2,0.99,1),(4,3,3,0.99,1);
