var tracks = require("./mock/tracks.json");
var artists = require("./mock/artists.json");
var last_fm = require("./mock/last_fm.json");
var soundcloud = require("./mock/soundcloud.json");
var spotify = require("./mock/spotify.json");
var albums = require("./mock/albums.json");
'use strict';
module.exports = function(db) {
    var api = {
        getTracks: getTracks,
        updateTrackById: updateTrackById,
        deleteTrack: deleteTrack,
        addTrack: addTrack,
        getTracksWithDetails: getTracksWithDetails
    };
    return api;

    function getTracks(callback) {
        db.query('SELECT * FROM tracks', function(err, rows) {
            if (err) {
                console.log("Error: " + err.stack);
            }
            else {
                callback(rows);
            }
        })
    }

    function updateTrackById(id, newTrack) {
        // MOCK CODE //
        //for (var i = 0; i < tracks.length; i++) {
        //    if (tracks[i].id == id) {
        //        tracks[i] = newTrack;
        //        return;
        //    }
        //}

         //NON-MOCK CODE
        //var id = newTrack.id;
        //var name = newTrack.track_name;
        //var duration = newTrack.duration;
        //var album_id = newTrack.album_id;
        //var genre = newTrack.genre;
        //var spotify_id = newTrack.spotify_id;
        //var cloud_id = newTrack.cloud_id;
        //var last_fm_id = newTrack.last_fm_id;
        //var custom_url = newTrack.custom_url;

        //connection.query('UPDATE users SET Name = :Name WHERE UserID = :UserID',
        //    {UserID: userId, Name: name})

        //db.query(
        //    "UPDATE tracks t" +
        //    "SET t.track_name = :name, t.duration = :duration, t.album_id = :album_id," +
        //    " t.genre = :genre, t.spotify_id = :spotify_id," +
        //    " t.cloud_id = :cloud_id, t.last_fm_id = :last_fm_id, t.custom_url = :custom_url" +
        //    " WHERE t.id = :id",
        //    [{
        //        name: name,
        //        duration: duration,
        //        album_id: album_id,
        //        genre: genre,
        //        spotify_id: spotify_id,
        //        cloud_id: cloud_id,
        //        last_fm_id: last_fm_id,
        //        custom_url: custom_url,
        //        id: id}
        //    ],
        //    function(err, rows) {
        //        if (err) {
        //            console.log("Error: " + err.stack);
        //        }
        //        else {
        //            return rows;
        //        }
        //})
    }

    function deleteTrack(trackId) {
        db.query('DELETE FROM tracks WHERE id = ?', [trackId], function(err, rows) {
            if (err) {
                console.log("Error: " + err.stack);
            }
            else {
               return rows;
            }
        });
    }

    function addTrack(newTrack) {
        var insertRecord = 'INSERT INTO tracks(track_name,duration,album_id,genre,spotify_id,cloud_id,last_fm_id,custom_url) VALUE(?,?,?,?,?,?,?,?)';

        db.query(insertRecord, [newTrack.track_name, null, null, newTrack.genre, null, null, null, newTrack.custom_url], function(err, rows) {
            if (err) {
                console.log("Error: " + err.stack);
            }
            else {
                return;
            }
        });

        return tracks;
    }

    function getTracksWithDetails(trackName) {
        var resultsTracks = [];
        var finalResults = [];
        for (var i = 0; i < tracks.length; i++) {
            if (tracks[i].track_name.toLowerCase() == trackName.toLowerCase()) {
                resultsTracks.push(tracks[i]);
            }
        }

        for (var i = 0; i < resultsTracks.length; i++) {
            var details = {};
            details.artistName = getArtistName(resultsTracks[i].artist_id);
            details.urls = [];
            details.urls.push(
                {url: getSoundcloudURL(resultsTracks[i].cloud_id),
                source: 'soundcloud'});
            details.urls.push(
                {url: getSpotifyURL(resultsTracks[i].spotify_id),
                source: 'spotify'});
            details.urls.push(
                {url: getLastFmURL(resultsTracks[i].last_fm_id),
                source: 'lastfm'});
            details.albumImage = getAlbumImage(resultsTracks[i].album_id);
            finalResults.push({});
            finalResults[i].track = resultsTracks[i];
            finalResults[i].details = details;
        }

        return finalResults;
    }

    function getArtistName(artistId) {
        for (var i = 0; i < artists.length; i++) {
            if (artists[i].id == artistId) {
                return artists[i].artist_name;
            }
        }
        return 'NULL';

        //NON-MOCK CODE//
        //db.query('SELECT artist_name FROM artists WHERE id = ?', [artistId], function(err, results) {
        //    if (err) {
        //        console.log("Error: " + err.stack);
        //    }
        //    else {
        //        console.log(results[0].artist_name);
        //        return results[0].artist_name;
        //    }
        //})
    }

    function getSoundcloudURL(soundcloudId) {
        for (var i = 0; i < soundcloud.length; i++) {
            if (soundcloud[i].id == soundcloudId) {
                return soundcloud[i].href;
            }
        }
        return 'NULL';
    }

    function getSpotifyURL(spotifyId) {
        for (var i = 0; i < spotify.length; i++) {
            if (spotify[i].id == spotifyId) {
                return spotify[i].href;
            }
        }
        return 'NULL';
    }

    function getLastFmURL(lastFmId) {
        for (var i = 0; i < last_fm.length; i++) {
            if (last_fm[i].id == lastFmId) {
                return last_fm[i].href;
            }
        }
        return 'NULL';
    }

    function getAlbumImage(albumId) {
        for (var i = 0; i < albums.length; i++) {
            if (albums[i].id == albumId) {
                return albums[i].picture;
            }
        }
        return 'NULL';
    }
};