module.exports = function(app, dataModel) {
    app.get("/api/tracks", getTracks);

    function getTracks(req, res) {
        dataModel.getTracks(function(rows) {
            res.json(rows);
        });
    }
}