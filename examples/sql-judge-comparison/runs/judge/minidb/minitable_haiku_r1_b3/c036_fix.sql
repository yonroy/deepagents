INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file');
INSERT INTO Playlist (PlaylistId, Name) VALUES (1, 'P1'), (2, 'P2'), (3, 'P3'), (4, 'P4'), (5, 'P5'), (6, 'P6');
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES
(1, 'Song A', 1, 1000, 0.99),
(2, 'Song B', 1, 1000, 0.99),
(3, 'Song C', 1, 1000, 0.99),
(4, 'Song D', 1, 1000, 0.99);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
(1, 2), (2, 2), (3, 2), (4, 2),
(1, 3), (2, 3), (3, 3), (4, 3), (5, 3), (6, 3),
(1, 4);
