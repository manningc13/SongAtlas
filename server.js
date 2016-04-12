var express = require('express');
var app = express();
var mysql = require("mysql");
var bodyParser = require('body-parser');

app.use(express.static(__dirname + '/front-end/client'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

var db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: "songatlas"
});

db.connect(function(err) {
    if (err) {
        console.log("Error " + err.stack);
        return;
    }
});

var ipaddress = '127.0.0.1';
var port = 3000;

require("./front-end/server/app.js")(app, db);
app.listen(port, ipaddress);

