var db = require('./manageDB');

exports.findAll = function (callback) {
    db.executeQuery("SELECT * FROM `ban_hang`.`users`", callback);
}

exports.create = function(user, callback){
    db.executeQuery("INSERT INTO `ban_hang`.`users` SET ?", user, callback);
}
exports.findOne = function (userId,callback) {
    db.executeQuery("SELECT * FROM `ban_hang`.`users` WHERE id = ?",userId, callback);
}
exports.delete = function (userId,callback) {
    db.executeQuery("DELETE FROM `ban_hang`.`users` WHERE id = ? ",userId, callback);
}
exports.update = function (user,callback) {
    db.executeQuery("UPDATE `ban_hang`.`users` SET ? WHERE `id` =?;",[user,user.id], callback);
}
