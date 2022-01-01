/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
	-- COUNT
	-------------------------------------------------------------------------------------------------	
	/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu
	
	SELECT count(*)
	FROM invoices;
	
	SELECT count(InvoiceId) as "Fatura Toplam"
	FROM invoices;
	
	/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/
	
	SELECT count(Composer) as "besteci sayısı"
	FROM tracks;
	
	SELECT count(DISTINCT Composer) as "besteci sayısı"
	FROM tracks;
	
		/* invoices tablosunda kaç adet farklı yıl olduğunu hesaplayan sorguyu yazınız*/
	
	SELECT count(InvoiceDate) as "Farklı yıl"
	FROM invoices;
	
		/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
	sorguyu yaziniz */
	
	SELECT name as Song_Name, min(Milliseconds)/1000.0 as Duration
	FROM tracks;
	-- 
	SELECT min(Grade), max(Grade)
	FROM students;
	
		-- SUM,AVG
	-------------------------------------------------------------------------------------------------	
	/* invoices  tablosundaki faturaların toplam değerini listeyiniz */
	
	SELECT sum(total) as "toplsm gelir"
	FROM invoices;
	
	/* invoices  tablosunda 2009 ile 2013 tarihileri arasındaki faturaların toplam 
	değerini listeyiniz */
	select sum(total) as "toplam"
	FROM invoices
	WHERE InvoiceDate BETWEEN "2009-01-01" and "2013-12-31 23:59:59";
	
	/* invoices  tablosundaki faturaların ortalama değerini listeyiniz */
	
	select avg(total) as "ortalam gelir"
	FROM invoices;
	
	select round(avg(total),2) as "ortalam gelir"
	FROM invoices;
	
		/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
	şarkıların adlarını listeleyiniz */
	
	SELECT round(avg(Milliseconds))
	FROM tracks;
	
	SELECT Name, Milliseconds
	FROM tracks
	where Milliseconds > 393599;
	
	-- sub-QUERY yöntemi ile yapma
	/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
	alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır sonraki 
	bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/
	
	SELECT Name, Milliseconds
	FROM tracks
	where Milliseconds > (SELECT avg(Milliseconds)
							FROM tracks);
							
/*===================================================
					GROUP BY
====================================================*/

	/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
	Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */
	
SELECT Composer, count(name) AS Song_Count
FROM tracks
WHERE Composer is not NULL -- NUlL olmayanları listele 
GROUP by Composer;	
	
	
	/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) göre gruplandırarak 
	ve müşteri sayısına göre AZALAN şekilde sıralayarak listeleyen sorguyu yazınız*/
	SELECT country, count(FirstName) as Nu_of_cust
	FROM customers
	GROUP by country
	ORDER by Nu_of_cust desc;
		
	
	/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) ve 
	Şehirlerine (City) 	göre gruplandırarak listeleyen sorguyu yazınız*/
	
	SELECT country, City, count(FirstName)
	FROM customers
	GROUP by country, City;
	
	/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
	hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/
	
	SELECT BillingCountry, round(avg(total),2) as ort_fatura
	FROM invoices
	WHERE InvoiceDate BETWEEN "2009-01-01" and "2011-12-31 23:59:59"
	GROUP by BillingCountry;
	

	/*===================================================
        JOINS
====================================================*/
    
--     Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
--     olusturmak icin kullanilabilir.
--     
--     JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
--    	Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
--     icin JOIN islemleri kullanilabilir.

--     Standart SQL'de en çok kullanılan Join islemleri:
--   	1) FULL JOIN:  Tablodaki tum sonuclari gosterir
--     2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
--     3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
--     4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--		NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
 
 /*===================================================*/   

  /* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/
 
 SELECT * from markalar;
 
 SELECT markalar.marka_id, markalar.marka_adi,
		siparisler.siparis_adedi, siparisler.siparis_tarihi
 FROM  markalar 
 JOIN siparisler -- default hali İNNER JOİN DİR
 on markalar.marka_id = siparisler.marka_id;
 
 -- LEFT JOİN YAZINCA  NELER OLUYOR.
 
  SELECT markalar.marka_id, markalar.marka_adi,
		siparisler.siparis_adedi, siparisler.siparis_tarihi
 FROM  markalar 
 LEFT JOIN siparisler -- default hali İNNER JOİN DİR
 on markalar.marka_id = siparisler.marka_id;

 
 