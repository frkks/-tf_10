
-- 1 --
SELECT name, Composer 
FROM tracks;

-- 2 --
SELECT *
FROM tracks;

-- 3--
SELECT DISTINCT Composer
FROM tracks;

-- 3--
SELECT DISTINCT AlbumId, MediaTypeId
FROM tracks;

-- 4--
SELECT Composer, name, TrackId
FROM tracks
WHERE Composer = "Jorge Ben";

--5--
SELECT *
FROM invoices
WHERE total >= 25;

--6--
SELECT *
FROM invoices
WHERE total < 15
limit 5;

--7--
SELECT *
FROM invoices;

--8--
SELECT *
FROM invoices
WHERE total > 10
ORDER by total DESC
limit 2;

--9--
SELECT *
FROM invoices
WHERE BillingCountry not in("Canada")
ORDER by total ASC
limit 10;

--10--
SELECT InvoiceId, CustomerId, total
FROM invoices
ORDER by CustomerId ASC, total DESC;

--11--
SELECT Name
FROM tracks
WHERE Name like "B%" AND  Name like "S%";

--12--
SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN "2008-01-01" and "2011-12-31"
ORDER by InvoiceDate DESC;
LIMIT 1;

--13--
SELECT LastName, FirstName, country
FROM customers
WHERE Country in ("Norway", "Belgium");

--14--
SELECT *
FROM tracks
WHERE Composer like "%zappa";

--15--
SELECT count(TrackId) --count(*)
FROM tracks;

SELECT count(InvoiceId)   --count(*)
FROM invoices;

--16--
SELECT count(DISTINCT CustomerId)
FROM customers;

--17--
SELECT AlbumId,
COUNT(*) AS number_of_tracks
FROM tracks
GROUP BY AlbumId
ORDER BY number_of_tracks DESC;

--18--
SELECT name, min(Milliseconds), max(Milliseconds)
FROM tracks;

--19--
SELECT name, Milliseconds
FROM tracks;
WHERE Milliseconds < (SELECT avg(Milliseconds
						from tracks));

--20--
SELECT Composer, count(*)
FROM tracks
GROUP by Composer;

--21--
SELECT *
FROM genres;

--22--
SELECT *
FROM albums;

