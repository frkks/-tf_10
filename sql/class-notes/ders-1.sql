/* yorum satırları böyle yazılır */
-- tek satır yorum satırları böyle yazılır.

SELECT name FROM tracks;

SELECT Composer, name FROM tracks;

SELECT * FROM tracks;

-- DISTINCT kodu tekrarları göstermemesi için kullanılır.

SELECT Composer FROM tracks;

SELECT DISTINCT Composer FROM tracks;

SELECT DISTINCT AlbumId, MediaTypeId FROM tracks;

-- WHERE ile ilgili sorgular

SELECT name 
FROM tracks 
WHERE Composer = "Jimi Hendrix";

SELECT *
FROM invoices 
WHERE total > 10;

SELECT CustomerId, InvoiceDate
FROM invoices 
WHERE total > 10;

