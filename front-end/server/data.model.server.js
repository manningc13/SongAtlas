'use strict'
module.exports = function(db) {
    var api = {
        getTracks: getTracks,
        updateTrackById: updateTrackById
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
        var id = newTrack.id;
        var name = newTrack.track_name;
        var duration = newTrack.duration;
        var album_id = newTrack.album_id;
        var genre = newTrack.genre;
        var spotify_id = newTrack.spotify_id;
        var cloud_id = newTrack.cloud_id;
        var last_fm_id = newTrack.last_fm_id;
        var custom_url = newTrack.custom_url;

        db.query('CALL update_track_by_ID('
            + id + ','
            + name + ','
            + duration + ','
            + album_id + ','
            + genre + ','
            + spotify_id + ','
            + cloud_id + ','
            + last_fm_id + ','
            + custom_url + ')',
            function(err, res) {
                if (err) {
                    console.log("Error: " + err.stack);
                }
                else {
                    console.log(res);
                    return res;
                }
            });
    }
}