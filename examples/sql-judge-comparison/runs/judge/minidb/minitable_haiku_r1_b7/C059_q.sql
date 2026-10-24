SELECT ar.Name, COUNT(*) AS n FROM Artist ar JOIN Album al ON al.ArtistId=ar.ArtistId GROUP BY ar.ArtistId HAVING n>10;
