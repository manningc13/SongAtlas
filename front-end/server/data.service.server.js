'use strict'
module.exports = function(app, dataModel) {
    app.get("/api/tracks", getTracks);
    app.put("/api/tracks/:trackId", updateTrackById);
    app.delete("/api/tracks/:trackId", deleteTrack);
    app.post("/api/tracks/", addTrack);
    app.get("/api/tracks/:trackName", getTracksWithDetails);

    function getTracks(req, res) {
        dataModel.getTracks(function(rows) {
            res.json(rows);
        });
    }

    function updateTrackById(req, res) {
        var newTrack = req.body;
        var trackId = req.params.trackId;
        var modelResponse = dataModel.updateTrackById(trackId, newTrack);
        res.json(modelResponse);
    }

    function deleteTrack(req, res) {
        var trackId = req.params.trackId;
        var tracks = dataModel.deleteTrack(trackId);
        res.json(tracks);
    }

    function addTrack(req, res) {
        var newTrack = req.body;
        var tracks = dataModel.addTrack(newTrack);
        res.json(tracks);
    }

    function getTracksWithDetails(req, res) {
        var trackName = req.params.trackName;
        var tracks = dataModel.getTracksWithDetails(trackName);
        res.json(tracks);
    }
}