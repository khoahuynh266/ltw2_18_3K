var OrdersModel = require('../models/Orders');    
var cm = require('../models/Orders');

exports.findAll = function(req,res)
{
    OrdersModel.findAllOrder(function(err,data)
    {
         if (err) {
                        res.status(400).send(err);
                        return;
                    }
        res.send(data);
    })
}

exports.PurchaseHistory = function(req,res)
{
    OrdersModel.PurchaseHistory(req.body,function (err, data) {
            if (err) {
                res.status(400).send(err);
                return;
            }
          res.send(data);
        }
    );
}

exports.DelOne = function (req, res) {
    var ID = req.params.ID;
     OrdersModel.DelOne(ID,function (err, data) {
            if (err) {
                res.status(400).send(err);
                return;
            }
          res.status(201).send();
        }
    );

};

exports.Pay = function(req,res)
{
    OrdersModel.Pay(req.body,function(err,data)
    {
           if (err) {
                res.status(400).send(err);
                return;
            }
          res.status(201).send();
        }
    )
}

exports.Detail = function (req, res) {
    var ID = req.params.ID;
     OrdersModel.Detail(ID,function (err, data) {
            if (err) {
                res.status(400).send(err);
                return;
            }
          res.send(data);
        }
    );

};


exports.UpdateStatusOrder = function(req,res)
{

    OrdersModel.UpdateStatusOrder(req.body,function(err,data){
        if (err) {
                res.status(400).send(err);
                return;
            }
            res.status(201).send();
            
        }
    );

};