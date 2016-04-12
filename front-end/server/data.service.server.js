'use strict'
module.exports = function(app, dataModel) {
    app.get("/api/tracks", getTracks);
    app.put("/api/tracks/:trackId", updateTrackById);

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
}