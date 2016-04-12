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
		INSERT INTO tracks (track_name, genre, custom_url, album_id, artist_id) VALUES(i_title, i_genre, i_url, 7, 7);
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
		SELECT s.href, c.href, f.href
		  FROM tracks t , spotify s, soundcloud c, last_fm f
		  WHERE t.id = i_track_id
		  GROUP BY t.id;
	END $$
DELIMITER ;

-- TEST CASES
CALL get_track_urls(4);
CALL get_track_urls(84);
CALL get_track_urls(100);
CALL get_track_urls(44);


