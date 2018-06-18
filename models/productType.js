var db = require('./manageDB');

exports.findAll = function (callback) {
    db.executeQuery("SELECT * from loai_san_pham", callback);
}
exports.create = function(productType, callback){
    db.executeQuery("INSERT INTO `ban_hang`.`loai_san_pham` SET ?", productType, callback);
}
exports.findOne = function (productTypeId,callback) {
    db.executeQuery("SELECT * FROM `ban_hang`.`loai_san_pham` WHERE id = ?",productTypeId, callback);
}

exports.delete = function (productTypeId,callback) {
    db.executeQuery("DELETE FROM `ban_hang`.`loai_san_pham` WHERE id = ? ",productTypeId, callback);
}
exports.update = function (productType,callback) {
    db.executeQuery("UPDATE `ban_hang`.`loai_san_pham` SET ? WHERE `id` =?;",[productType,productType.id], callback);
}
