var db = require('./manageDB');

exports.findAll = function (callback) {
    db.executeQuery("select * from san_pham", callback);
}
exports.GetNumItems  = function (callback) {
    db.executeQuery("select * from san_pham", callback);
}
exports.create = function(product, callback){
    db.executeQuery("INSERT INTO `ban_hang`.`san_pham` SET ?", product, callback);
}

exports.findOne = function (productId,callback) {
    db.executeQuery("SELECT * FROM `ban_hang`.`san_pham` s, nha_san_xuat n WHERE s.id_nsx = n.id and s.id = ?",productId, callback);
}

exports.getProductsByProducer = function (id_nsx,callback) {
    db.executeQuery("SELECT * FROM `san_pham` WHERE id_nsx = ?",id_nsx, callback);
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
exports.getProductPage = function (pageNumber,callback) {
    var next_page = pageNumber + 1;
    var prev_page = pageNumber - 1;
    var limit = 15;
    var offset = (pageNumber - 1) * limit;
    db.executeQuery("select * from san_pham limit ? , ? ",[offset,limit], callback);
}

exports.getTotalPage = function (callback) {
    db.executeQuery("select count(*) from san_pham ", callback);
}
exports.productSamType = function (typeID,callback) {
    db.executeQuery("select *  from san_pham where loai = ? limit 5",typeID, callback);
}
exports.productSamProducer= function (producerID,callback) {
    db.executeQuery("select * from san_pham where id_nsx = ? limit 5",producerID, callback);
}

exports.UpdateView = function(req,callback)
{
    db.executeQuery("Update san_pham set luotxem = luotxem + 1 where id = ?",req,callback);
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



