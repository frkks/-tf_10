 SELECT * FROM markalar;
	 SELECT * FROM siparisler;

    /*SELECT t1.x, t2.y, ....
	FROM TABLO1 t1
	FULL JOIN TABLO2 t2
	ON t1.FK = t2.PK;*/


SELECT m.marka_id, m.marka_adi, s.siparis_adedi, s.siparis_tarihi
FROM markalar m
INNER JOIN siparisler s
on m.marka_id = s.marka_id;

SELECT m.marka_id, m.marka_adi, s.siparis_adedi, s.siparis_tarihi
FROM markalar m
LEFT JOIN siparisler s
on m.marka_id = s.marka_id;
 /* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/
 
	 SELECT * FROM markalar;
	 SELECT * FROM siparisler;
	 
	 SELECT m.marka_id,m.marka_adi, s.siparis_adedi, s.siparis_tarihi
	 FROM markalar m
	 JOIN siparisler s
	 ON m.marka_id = s.marka_id;
 
 /* ÖDEV: Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının türü (genre)
listeleyiniz.*/
SELECT * FROM tracks;
SELECT * FROM genres;

SELECT t.name as Song_Name, g.name as Song_Genre
FROM tracks t
left JOIN genres g
on  t.GenreId = g.GenreId;

	 
 /* ÖDEV: invoice tablosundaki faturaların her birinin müşteri adını (FirstName),
 soyadını (lastName), fatura tarihi (InvoiceDate) ve fatura meblağını (total) 
 listeleyen sorguyu yazınız */
 
 SELECT * FROM invoices;
 SELECT * FROM customers;
 
 SELECT c.FirstName, c.LastName,i.InvoiceDate, i.total
 FROM invoices i
 JOIN customers c
 on i.CustomerId = c.CustomerId;
 
	
	/* ÖDEV: artists tablosunda bulunan her bir kişinin albums tablosunda 
bulunan tüm albümlerinin listeleyen sorguyu yazınız. 
Sorguda ArtistId, Name, Title ve AlbumId olmalıdır */

SELECT * from artists;
SELECT * FROM albums;

SELECT ar.ArtistId, ar.name, al.Title, al.AlbumId
FROM artists ar
left JOIN albums al
ON ar.ArtistId = al.ArtistId;

/*===================================================
 SUBQUERIES
====================================================*/

	/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
	tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
	Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */

SELECT TrackId, name, AlbumId
FROM tracks
WHERE AlbumId = (SELECT AlbumId
				 FROM albums
				 WHERE Title = "Faceless");	

				 /* JOİN*/
SELECT t.TrackId, t.name, t.AlbumId
FROM tracks t
JOIN albums a
ON t.AlbumId = a.AlbumId
WHERE a.Title = "Faceless";	

/*   AND*/

SELECT t.TrackId, t.name, t.AlbumId
FROM tracks t
JOIN albums a
ON t.AlbumId = a.AlbumId AND a.Title = "Faceless";


/* albums tablosundaki Title sutunu  veya  olan kayıtların 
	albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
	SUBQUERY kullanarak listeyiniz. Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */

SELECT TrackId, name, AlbumId
FROM tracks 
WHERE AlbumId in (SELECT AlbumId
					from albums
					WHERE Title in ("Faceless","Let There Be Rock"));
					
SELECT TrackId, tracks.name, tracks.AlbumId, albums.Title
FROM tracks, albums 
WHERE tracks.AlbumId in (SELECT AlbumId
					from albums
					WHERE Title in ("Faceless","Let There Be Rock"));




