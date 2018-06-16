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


exports.Search = function(req,callback)
{
    var sql;
    var str;
    if(!isNaN(req)) // tìm theo giá
    {
        sql = "select * from san_pham where gia like N'%"+req+"%'";
        db.executeQuery(sql, function (err, data){
            callback(err, data);
        });
    }
    else
    {   str = decodeURI(req);
        // theo tên sản phẩm
        var num_rows = 0;
        var num_rows1 = 0;
        sql = "select count(*) as num_rows from san_pham where tensp like N'%"+ str +"%'";

        db.executeQuery(sql,function (err, data){
            num_rows = data[0].num_rows;
            sql = "select * from san_pham where tensp like N'%"+ str +"%'";
            // theo nhà sản xuất
            if(num_rows===0)
            {
                sql = "select count(*) as num_rows from san_pham p , nha_san_xuat n where p.id_nsx = n.id and n.ten_nsx like N'%"+ str +"%'";
                db.executeQuery(sql, function (err, data){
                    num_rows1 = data[0].num_rows;
                });
                sql = "select * from san_pham p left join nha_san_xuat n on p.id_nsx = n.id where n.ten_nsx like N'%"+ str +"%'";

            }
            if(num_rows1===1)
            {
               sql = "select * from san_pham p , loai_san_pham l where p.loai = l.id and l.ten like '%"+ str +"%'";
            }


            console.log(sql);
            db.executeQuery(sql, function (err, data){
                callback(err, data);
            });
        });
    }


}


