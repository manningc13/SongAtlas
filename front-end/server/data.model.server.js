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

    function getTracksWithDetails(trackName, callback) {
        var resultList = [];

        db.query("CALL get_track_details(?)", [trackName], function(err, results, fields) {
            if (err) {
                console.log(err);
            }
            else {
                var resultTrack = results[0][0];
                var track = {};
                track.id = resultTrack.id;
                track.track_name = resultTrack.track_name;
                track.duration = resultTrack.duration;
                track.album_id = resultTrack.album_id;
                track.genre = resultTrack.genre;
                track.spotify_id = resultTrack.spotify_id;
                track.cloud_id = resultTrack.cloud_id;
                track.last_fm_id = resultTrack.last_fm_id;
                track.custom_url = resultTrack.custom_url;
                track.artist_id = resultTrack.artist_id;

                var details = {}
                details.artistName = resultTrack.artist_name;
                details.albumImage = resultTrack.picture;
                details.urls = [];
                details.urls.push({
                    url: resultTrack.urls.replace(/\s+/g, '').split(',')[0],
                    source: 'spotify'
                });
                details.urls.push({
                    url: resultTrack.urls.replace(/\s+/g, '').split(',')[1],
                    source: 'soundcloud'
                });
                details.urls.push({
                    url: resultTrack.urls.replace(/\s+/g, '').split(',')[2],
                    source: 'lastfm'
                });

                resultList.push({
                    track: track,
                    details: details
                });

                callback(resultList);
            }
        });
    }
};