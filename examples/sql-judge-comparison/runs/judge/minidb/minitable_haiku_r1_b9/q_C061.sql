SELECT ROUND(AVG(t.UnitPrice), 2) AS avg_price FROM Track t JOIN MediaType m ON m.MediaTypeId = t.MediaTypeId;
