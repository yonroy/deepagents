SELECT AVG(t.UnitPrice) AS avg_unit_price FROM Track t JOIN MediaType m ON t.MediaTypeId = m.MediaTypeId WHERE m.Name = 'Protected AAC audio file';
