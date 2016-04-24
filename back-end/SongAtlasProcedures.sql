-- Stored Procedures for Database Design Project
use songatlas;

-- Update Track by ID
-- ---------------------
-- Updates all fields of a track with a matching given track ID
DROP PROCEDURE IF EXISTS update_track_by_ID;
DELIMITER $$

CREATE PROCEDURE update_track_by_ID(IN i_track_id INT(11), IN i_name VARCHAR(50), IN i_duration  TIME, IN i_album INT(11), IN i_genre VARCHAR(15),
										IN i_spotify INT(11), IN i_soundcloud INT(11), IN i_lastfm INT(11), IN i_custom INT(11) )
	BEGIN
		UPDATE tracks t
        SET t.track_name = i_name, t.duration = i_duration, t.album_id = i_album, t.genre = i_genre, t.spotify_id = i_spotify,
			t.cloud_id = i_soundcloud, t.last_fm_id = i_lastfm, t.custom_url = i_custom
		WHERE t.id = i_track_id;
	END $$  
DELIMITER ;


-- Delete Track by ID
-- -------------------
-- Deletes a track from the tracks table in the database matching the given track ID
DROP PROCEDURE IF EXISTS delete_track_by_id;
DELIMITER $$

CREATE PROCEDURE delete_track_by_id(IN i_track_id INT(11) )
    BEGIN
		DELETE FROM tracks 
        WHERE id = i_track_id;
	END $$
DELIMITER ;


-- Add Track 
-- ---------
-- Procedure takes in the information for a track and inserts the new given track into the tracks table
DROP PROCEDURE IF EXISTS add_track;
DELIMITER $$

CREATE PROCEDURE add_track(IN i_title VARCHAR(50), IN i_genre VARCHAR(15), IN i_url VARCHAR(100) )
	BEGIN
		INSERT INTO tracks (track_name, genre, custom_url, album_id, artist_id, spotify_id, cloud_id, last_fm_id) VALUES(i_title, i_genre, i_url, 7, 7, 81, 37, 6);
	END $$
DELIMITER ;

-- TESTS CASES
-- CALL add_track("Fever", "Alternative", "https://manning-chris.com");

-- Get Track By Name
-- -----------------
-- Queries the tracks table for entries with track_name = given track name
DROP PROCEDURE IF EXISTS get_track_by_name;
DELIMITER $$

CREATE PROCEDURE get_track_by_name(IN i_name VARCHAR(50) )

	BEGIN
		SELECT * FROM tracks t
        WHERE t.track_name = i_name;
	END $$
DELIMITER ;

-- TESTS CASES
CALL get_track_by_name("Viva La Vida");
CALL get_track_by_name("wElCoMe To ThE jUnGlE"); -- Test case for whether or not uppercase/lowercase matters....it doesn't/shouldn't


-- Get Track URLs
-- --------------
-- Queries the tracks database to find all URLs of a given track_id
DROP PROCEDURE IF EXISTS get_track_urls;
DELIMITER $$

CREATE PROCEDURE get_track_urls(IN i_track_id INT(11) )
	BEGIN
		SELECT sp.href, sc.href, fm.href, x.custom_url
		FROM (SELECT t.spotify_id, t.cloud_id, t.last_fm_id , t.custom_url
			  FROM tracks t 
		      WHERE t.id = i_track_id) x JOIN spotify sp ON x.spotify_id = sp.id
										 JOIN soundcloud sc ON x.cloud_id = sc.id
										 JOIN last_fm fm ON x.last_fm_id = fm.id;
	END $$
DELIMITER ;

-- TEST CASES
CALL get_track_urls(4);
CALL get_track_urls(84);
CALL get_track_urls(100);
CALL get_track_urls(44);


-- Get Tracks by ID
-- ------------------
-- Query that results with the entire track 'object' for just a given track id
DROP PROCEDURE IF EXISTS get_track_by_id;
DELIMITER $$

CREATE PROCEDURE get_track_by_id(IN i_track_id INT(11) )
	BEGIN
		SELECT * FROM tracks
        WHERE id = i_track_id;
	END $$
DELIMITER ;

-- TEST CASES
CALL get_track_by_id(5);
CALL get_track_by_id(57);



-- Get Tracks with Details
-- ----------------------
-- Query that will be for the main function of the search bar. Takes in a single string
-- for a song title and returns the needed details on the search page

DROP PROCEDURE IF EXISTS get_track_details;
DELIMITER $$

CREATE PROCEDURE get_track_details(IN i_track_title VARCHAR(50) )
	BEGIN
		SELECT t.*, ar.artist_name, CONCAT(sp.href," , ", sc.href, " , ", fm.href) AS urls, al.picture
        FROM tracks t JOIN artists ar ON t.artist_id = ar.id
					  JOIN albums al ON t.album_id = al.id
                      JOIN spotify sp ON t.spotify_id = sp.id
					  JOIN soundcloud sc ON t.cloud_id = sc.id
					  JOIN last_fm fm ON t.last_fm_id = fm.id
		WHERE t.track_name = i_track_title;
	END $$
DELIMITER ;

CALL get_track_details("Smooth Criminal");
CALL get_track_details("bulls on paradE");