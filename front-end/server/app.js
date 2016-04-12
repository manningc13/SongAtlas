module.exports = function(app, db) {
    var dataModel = require("./data.model.server.js")(db);
    var dataService = require("./data.service.server.js")(app, dataModel);
}