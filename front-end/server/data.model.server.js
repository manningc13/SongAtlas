module.exports = function(db) {
    var api = {
        getTracks: getTracks,
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
}