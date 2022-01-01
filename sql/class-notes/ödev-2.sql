/*1.How many tracks does each album have? Your solution 
should include Album id and its number of tracks sorted 
from highest to lowest.*/

SELECT COUNT("tracks.TrackId") AS Total_tracks, albums.AlbumId 
FROM tracks INNER JOIN albums on  albums.AlbumId=tracks.AlbumId 
GROUP BY albums.AlbumId
ORDER BY Total_tracks DESC;

/*Find the album title of the tracks. Your solution should 
include track name and its album title.*/

SELECT tracks.Name AS tracksname, albums.AlbumId as albumstitle
FROM tracks INNER JOIN albums on albums.AlbumId=tracks.AlbumId;

 /* Find the minimum duration of the track in each album. Your 
 solution should include album id, album title and duration of 
 the track sorted from highest to lowest.*/
 
 SELECT albums.Title, albums.AlbumId, min(tracks.Milliseconds)
 FROM tracks INNER JOIN albums on albums.AlbumId=tracks.AlbumId
 GROUP BY albums.AlbumId
 ORDER by tracks.Milliseconds DESC;

 /*Find the total duration of each album. Your solution should 
 include album id, album title and its total duration sorted 
 from highest to lowest.*/
 
 SELECT sum(Milliseconds) as Toplam_sure, albums.Title, albums.AlbumId
 FROM tracks INNER JOIN albums on albums.AlbumId=tracks.AlbumId
 GROUP BY albums.AlbumId
 ORDER by Toplam_sure DESC;

 /*Based on the previous question, find the albums whose total duration
 is higher than 70 minutes. Your solution should include album title 
 and total duration*/
 
 SELECT sum(Milliseconds) as Toplam_sure, albums.Title, albums.AlbumId
 FROM tracks INNER JOIN albums on albums.AlbumId=tracks.AlbumId
 GROUP BY albums.AlbumId
 ORDER by Toplam_sure DESC
 WHERE Toplam_sure > 420000;
 