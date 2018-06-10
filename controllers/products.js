var productsModel = require('../models/products');
exports.create = function (req, res) {
    // Create and Save a new product
    productsModel.create(req.body, function (err,data) {
        if (err) {
            res.status(400).send(err);
            return;
        }
        res.status(201).send();
    })
};

exports.findAll = function (req, res) {
    // Retrieve and return all notes from the database.
    productsModel.findAll(function (err, data) {
            if (err) {
                res.status(400).send(err);
                return;
            }
            res.send(data);
        }
    );
};

exports.findAllProduct_Type = function(req, res) {
    // Find a single productType with a productTypeId
    productModel.findOne(req.params.productIdNSX, function(err, data) {
        if(err) {
            console.log(err);
            if(err.kind === 'ObjectId') {
                return res.status(404).send({message: "product not found with id " + req.params.productNSXIdNSX});
            }

            if(!data) {
                return res.status(404).send({message: "product not found with id " + req.params.productIdNSX});
            }

        }
        res.send(data);
    });
};


exports.findOne = function(req, res) {
    // Find a single products with a productId
    productsModel.findOne(req.params.productId, function(err, data) {
        if(err) {
            console.log(err);
            if(err.kind === 'ObjectId') {
                return res.status(404).send({message: "products not found with id " + req.params.productId});
            }

            if(!data) {
                return res.status(404).send({message: "products not found with id " + req.params.productId});
            }

        }
        res.send(data);
    });
};

exports.update = function(req, res) {
    // Update a products identified by the productId in the request

    var updates = req.body;
    updates.id = req.params.productId;
    productsModel.update(updates, function (err, data) {
        if (err) {
            res.status(500).send({message: "Could not update products with id " + req.params.productId});
        } else {
            res.send(data);
        }
    });
}


exports.delete = function(req, res) {
    // Delete a products with the specified productId in the request
    productsModel.delete(req.params.productId, function (err, data) {
        if (err) {
            console.log(err);
            if (err.kind === 'ObjectId') {
                return res.status(404).send({message: "products not found with id " + req.params.productId});
            }
            return res.status(500).send({message: "Could not delete products with id " + req.params.productId});
        }

        if (!data) {
            return res.status(404).send({message: "products not found with id " + req.params.productId});
        }
        res.send({message: "Note deleted successfully!"});
    });
}
