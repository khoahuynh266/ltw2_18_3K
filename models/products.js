var db = require('./manageDB');

exports.findAll = function (callback) {
    db.executeQuery("select * from san_pham", callback);
}
exports.create = function(product, callback){
    db.executeQuery("INSERT INTO `ban_hang`.`san_pham` SET ?", product, callback);
}
exports.findOne = function (productId,callback) {
    db.executeQuery("SELECT * FROM `ban_hang`.`san_pham` WHERE id = ?",productId, callback);
}
exports.delete = function (productId,callback) {
    db.executeQuery("DELETE FROM `ban_hang`.`san_pham` WHERE id = ? ",productId, callback);
}
exports.update = function (product,callback) {
    db.executeQuery("UPDATE `ban_hang`.`san_pham` SET ? WHERE `id` =?;",[product,product.id], callback);
}
