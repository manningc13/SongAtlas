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
        var name = newTrack.track_name;
        var duration = newTrack.duration;
        var album_id = newTrack.album_id;
        var genre = newTrack.genre;
        var spotify_id = newTrack.spotify_id;
        var cloud_id = newTrack.cloud_id;
        var last_fm_id = newTrack.last_fm_id;
        var custom_url = newTrack.custom_url;

        var myParams = [id,name,duration,album_id,genre,spotify_id,cloud_id,last_fm_id,custom_url];
        db.query("CALL update_track_by_id(?,?,?,?,?,?,?,?,?)", myParams, function(err, results, fields) {
            if (err) {
                console.log(err);
            }
            else {
                return;
            }
        });
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
        db.query('SELECT artist_name FROM artists WHERE id = ?', [artistId], function(err, results) {
            if (err) {
                console.log("Error: " + err.stack);
            }
            else {
                console.log(results[0].artist_name);
                return results[0].artist_name;
            }
        })
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