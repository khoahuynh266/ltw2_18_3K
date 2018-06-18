var db = require('./manageDB');

exports.findAll = function (callback) {
    db.executeQuery("SELECT * from nha_san_xuat", callback);
}
exports.create = function(Producer, callback){
    db.executeQuery("INSERT INTO `ban_hang`.`nha_san_xuat` SET ?", Producer, callback);
}
exports.findOne = function (ProducerId,callback) {
    db.executeQuery("SELECT * FROM `ban_hang`.`nha_san_xuat` WHERE id = ?",ProducerId, callback);
}

exports.delete = function (ProducerId,callback) {
    db.executeQuery("DELETE FROM `ban_hang`.`nha_san_xuat` WHERE id = ? ",ProducerId, callback);
}
exports.update = function (Producer,callback) {
    db.executeQuery("UPDATE `ban_hang`.`nha_san_xuat` SET ? WHERE `id` =?;",[Producer,Producer.id], callback);
}
