SELECT COUNT(*) AS n_albums FROM ( SELECT AlbumId FROM Track WHERE Composer IS NULL GROUP BY AlbumId HAVING SUM(Milliseconds) > 3600000 );
