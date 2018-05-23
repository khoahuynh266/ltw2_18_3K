var db = require('./manageDB');

var md5 = require('md5');



exports.findUser = function (req,callback) {
    db.executeQuery("SELECT * FROM `ban_hang`.`users` WHERE  email = ? and password = ?", [req.email,(req.password)],callback);
}
