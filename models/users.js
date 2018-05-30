var db = require('./manageDB');

exports.findAll = function (callback) {
    db.executeQuery("SELECT * FROM `ban_hang`.`users`", callback);
}

exports.create = function(user, callback){
    db.executeQuery("INSERT INTO `ban_hang`.`users` SET ?", user, callback);
}
exports.findOneByEmail = function (email,callback) {
    db.executeQuery("SELECT * FROM `ban_hang`.`users` WHERE email = ?",email, callback);
}
exports.delete = function (id,callback) {
    db.executeQuery("DELETE FROM `ban_hang`.`users` WHERE id = ? ",id, callback);
}
exports.update = function (user,callback) {
    db.executeQuery("UPDATE `ban_hang`.`users` SET ? WHERE `id` =?;",[user,user.id], callback);
}

var md5 = require('md5');

exports.findOneById = function(id,callback)
{
    db.executeQuery("SELECT * FROM `ban_hang`.`users` WHERE id = ? ",id,callback);
}


