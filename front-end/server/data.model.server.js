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
        // MOCK CODE //
        callback(tracks);

        // NON-MOCK CODE //
        //db.query('SELECT * FROM tracks', function(err, rows) {
        //    if (err) {
        //        console.log("Error: " + err.stack);
        //    }
        //    else {
        //        callback(rows);
        //    }
        //})
    }

    function updateTrackById(id, newTrack) {
        // MOCK CODE //
        for (var i = 0; i < tracks.length; i++) {
            if (tracks[i].id == id) {
                tracks[i] = newTrack;
                return;
            }
        }

        // NON-MOCK CODE //
        //var id = newTrack.id;
        //var name = newTrack.track_name;
        //var duration = newTrack.duration;
        //var album_id = newTrack.album_id;
        //var genre = newTrack.genre;
        //var spotify_id = newTrack.spotify_id;
        //var cloud_id = newTrack.cloud_id;
        //var last_fm_id = newTrack.last_fm_id;
        //var custom_url = newTrack.custom_url;
        //
        //db.query('CALL update_track_by_ID('
        //    + id + ','
        //    + name + ','
        //    + duration + ','
        //    + album_id + ','
        //    + genre + ','
        //    + spotify_id + ','
        //    + cloud_id + ','
        //    + last_fm_id + ','
        //    + custom_url + ')',
        //    function(err, res) {
        //        if (err) {
        //            console.log("Error: " + err.stack);
        //        }
        //        else {
        //            console.log(res);
        //            return res;
        //        }
        //    });
    }

    function deleteTrack(trackId) {
        // MOCK CODE //
        for (var i = 0; i < tracks.length; i++) {
            if (tracks[i].id == trackId) {
                tracks.splice(i, 1);
                break;
            }
        }
        return tracks;
    }

    function addTrack(newTrack) {
        var tempId = -9999;
        for (var i = 0; i < tracks.length; i++) {
            if (tracks[i].id >= tempId) {
                tempId = tracks[i].id + 1;
            }
        }

        newTrack.id = tempId;
        newTrack.duration = "??:??:??";
        newTrack.album_id = null;
        newTrack.spotify_id = null;
        newTrack.cloud_id = null;
        newTrack.last_fm_id = null;
        tracks.push(newTrack);

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