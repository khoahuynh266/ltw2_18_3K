var db = require('./manageDB');

exports.findAll = function (callback) {
    db.executeQuery("SELECT * from nha_san_xuat", callback);
}
exports.create = function(productType, callback){
    db.executeQuery("INSERT INTO `ban_hang`.`nha_san_xuat` SET ?", productType, callback);
}
exports.findOne = function (productTypeId,callback) {
    db.executeQuery("SELECT * FROM `ban_hang`.`nha_san_xuat` WHERE id = ?",productTypeId, callback);
}
exports.delete = function (productTypeId,callback) {
    db.executeQuery("DELETE FROM `ban_hang`.`nha_san_xuat` WHERE id = ? ",productTypeId, callback);
}
exports.update = function (productType,callback) {
    db.executeQuery("UPDATE `ban_hang`.`nha_san_xuat` SET ? WHERE `id` =?;",[productType,productType.id], callback);
}
