--     1   ---

SELECT InvoiceId, CustomerId, total 
FROM invoices
ORDER by CustomerId ASC, total DESC;

--     2   ---

SELECT InvoiceId, CustomerId, total 
FROM invoices
ORDER by  total DESC, CustomerId ASC;

--     3   ---

/*===================================================
	ilk sorguda önce CustomerId sıralamasını artan olarak yaptı ve 
	CustomerId ler kendi arasında total toplamrı azalan 
	sırasıyls sıraladı.
====================================================*/

--     4   ---

SELECT * 
FROM invoices
WHERE total >= 10
LIMIT 10;

--     5   ---
SELECT * 
FROM invoices
LIMIT 5;

--     6   ---
SELECT *
FROM tracks
where name like  "b%" or name like "%s";

--     7   ---

SELECT * 
FROM invoices
where BillingCountry IN('USA', 'Germany ', 'Norway', 'Canada') 
or InvoiceDate BETWEEN '2010-01-01 00:00:00'  AND  '2010-12-31 00:00:00'  
ORDER BY InvoiceDate DESC;

