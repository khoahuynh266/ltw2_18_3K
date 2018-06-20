var db = require('./manageDB');


//lấy ds các đơn hàng theo ngày gần nhất

exports.findAll = function(callback)
{

	db.executeQuery("SELECT o.id , SUM(od.soluong) as soluong, o.trangthai , u.fullname , u.phone FROM don_hang o , chi_tiet_don_hang od , users u where o.id = od.id and o.id = u.id GROUP BY o.id",callback);
}

exports.DelOne = function(req,callback)
{
	console.log("Xóa thành công hóa đơn");
	db.executeQuery("delete FROM don_hang where id = ?",req,callback);
}

exports.PurchaseHistory = function(req,callback)
{
	console.log(req);
	db.executeQuery("SELECT * FROM don_hang o where o.id = ?",req.id,callback);
}


exports.Detail = function(req,callback)
{
	
	db.executeQuery("SELECT * FROM don_hang o , chi_tiet_don_hang od , san_pham p , users u where p.id = od.id_sanpham and o.id = u.id and o.id = od.id AND o.id = ? ",req,callback);
}



exports.UpdatetrangthaiOrder = function(req,callback)
{
	console.log(req);
	db.executeQuery("Update don_hang set trangthai = ? where id = ?",[req.trangthai,req.id],callback);
}


exports.Pay = function(req,callback)
{
	var sql2 = "insert into don_hang(`id`, `id_nguoidung`, `tongsp`, `tongtien`, `trangthai`, `created_at`) values(?,?,?,?,?,?)";
	db.executeQuery(sql2,req,callback);  // insert hóa đơn 
	MaxProID = 0;
	var sql = "SELECT Max(id) as Max FROM don_hang";
	db.executeQuery(sql, function (err, data){
			
     			MaxProID = data[0].Max;
     			for(var i = 0 ; i < req.SaveProduct.length;i=i+4)
				{
						var ProID = req.SaveProduct[i];
					    var Quantity = req.SaveProduct[i+3];
					    var Price = req.SaveProduct[i+2];
					    var soluong = Quantity*Price;
					    var sql1 = "update san_pham set soluong = soluong -"+ Quantity +" where id = "+ProID+"";
					    var sql = "update san_pham set daban = daban +"+Quantity +" where id = "+ProID+"";
					    
					    // var sql2 = "insert into chi_tiet_don_hang values('"+ MaxProID +"','"+ ProID +"','"+ Quantity+"','"+ Price+"','"+soluong+"','"+req.CurrentTime+"')";
						var sql2 = "INSERT INTO `chi_tiet_don_hang` (`id_donhang`, `id_sanpham`, `soluong`, `giaban`, `giatien`) VALUES (?,?,?,?,?)"
						db.executeQuery(sql, function (err, data){
				     			callback(err, data);
						});

						db.executeQuery(sql1, function (err, data){
				     			callback(err, data);
						});

						db.executeQuery(sql2, function (err, data){
				     			callback(err, data);
						});

				}
				
		});
