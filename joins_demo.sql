SELECT * FROM artist

Select * FROM favorite_song

-- Left Table (From clause)
-- Right table (join clause)

Select *
FROM artist
INNER JOIN favorite_song
ON artist.artist_id = favorite_song.artist_id

-- LEFT JOIN
SELECT *
FROM artist
LEFT JOIN favorite_song
ON artist.artist_id = favorite_song.artist_id

-- RIGHT JOIN
SELECT *
FROM artist
RIGHT JOIN favorite_song
ON artist.artist_id = favorite_song.artist_id

-- FULL JOIN
SELECT *
FROM artist
FULL JOIN favorite_song
ON artist.artist_id = favorite_song.artist_id


-- SUB-query example

SELECT artist_name, song_name
FROM (
    SELECT *
FROM artist
FULL JOIN favorite_song
ON artist.artist_id = favorite_song.artist_id
) as all_info;

-- basic commands we learned day 1 are still applicable

SELECT artist_name, f_s.song_name, plays
FROM artist
INNER JOIN favorite_song AS f_s
ON artist.artist_id = f_s.artist_id
WHERE plays > 2000000
ORDER BY plays DESC;