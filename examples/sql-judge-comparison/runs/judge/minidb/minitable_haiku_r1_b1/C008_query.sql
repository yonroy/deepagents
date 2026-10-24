SELECT m.Name, COUNT(DISTINCT t.TrackId) AS n FROM MediaType m JOIN Track t ON t.MediaTypeId=m.MediaTypeId JOIN InvoiceLine il ON il.TrackId=t.TrackId GROUP BY m.MediaTypeId;
