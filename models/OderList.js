var db = require('./manageDB');

exports.findAll = function (callback) {
    db.executeQuery("SELECT * from `don_hang`", callback);
}
exports.create = function(OderList, callback) {
    db.executeQuery("INSERT INTO `don_hang` SET ?", OderList, callback);
}
exports.findOne = function (OderListId,callback) {
    db.executeQuery("SELECT * FROM `don_hang` WHERE id = ?",OderListId, callback);
}

exports.delete = function (OderListId,callback) {
    db.executeQuery("DELETE FROM `don_hang` WHERE id = ? ",OderListId, callback);
}
exports.update = function (OderList,callback) {
    db.executeQuery("UPDATE `don_hang` SET ? WHERE `id` =?;",[OderList,OderList.id], callback);
}