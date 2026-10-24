INSERT INTO MediaType (MediaTypeId, Name) VALUES (1,'MPEG audio file'),(2,'Protected AAC audio file');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES
(1,'AAC cheap',2,200000,0.99),
(2,'AAC pricey',2,200000,1.99),
(3,'MPEG expensive',1,200000,5.00);
