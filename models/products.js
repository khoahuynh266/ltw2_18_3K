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

exports.findAllProduct_Type = function (productTypeIdNSX,callback) {
    db.executeQuery("SELECT * FROM `san_pham` WHERE id_nsx = ?",productIdNSX, callback);
}

exports.delete = function (productId,callback) {
    db.executeQuery("DELETE FROM `ban_hang`.`san_pham` WHERE id = ? ",productId, callback);
}

exports.update = function (product,callback) {
    db.executeQuery("UPDATE `ban_hang`.`san_pham` SET ? WHERE `id` =?;",[product,product.id], callback);
}

exports.bestview = function (callback) {
    db.executeQuery("select * from san_pham ORDER BY luotxem DESC limit 10", callback);
}

exports.newest = function (callback) {
    db.executeQuery("select * from san_pham ORDER BY created_at DESC limit 10", callback);
}

exports.bestseller = function (callback) {
    db.executeQuery("select * from san_pham ORDER BY daban DESC limit 10", callback);
}