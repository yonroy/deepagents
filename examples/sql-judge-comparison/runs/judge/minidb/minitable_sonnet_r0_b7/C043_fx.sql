INSERT INTO MediaType VALUES (1,'m');
INSERT INTO Artist VALUES (1,'Iron Maiden'),(2,'Iron Maiden Tribute'),(3,'Other');
INSERT INTO Album VALUES (1,'Killers',1),(2,'Empty Album',1),(3,'Killers',2),(4,'Other Album',3),(5,'Powerslave',1);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES
(1,'a',1,1,1000,1),(2,'b',1,1,1000,1),(3,'c',1,1,1000,1),(4,'d',3,1,1000,1),(5,'e',4,1,1000,1),(6,'f',5,1,1000,1),(7,'g',5,1,1000,1),(8,'h',NULL,1,1000,1);
