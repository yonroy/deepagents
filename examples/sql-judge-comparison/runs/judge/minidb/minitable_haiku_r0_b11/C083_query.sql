SELECT AVG(t.UnitPrice) FROM Track t JOIN MediaType m ON t.MediaTypeId=m.MediaTypeId WHERE m.Name='Protected AAC audio file';
