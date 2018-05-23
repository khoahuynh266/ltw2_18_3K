var productTypeModel = require('../models/productType')

exports.create = function (req, res) {
    // Create and Save a new product
    productTypeModel.create(req.body, function (err,data) {
        if (err) {
            res.status(400).send(err);
            return;
        }
        res.status(201).send();
    })
};

exports.findAll = function (req, res) {
    // Retrieve and return all notes from the database.
    productTypeModel.findAll(function (err, data) {
            if (err) {
                res.status(400).send(err);
                return;
            }
            res.send(data);
        }
    );
};


exports.findOne = function(req, res) {
    // Find a single productType with a productTypeId
    productTypeModel.findOne(req.params.productTypeId, function(err, data) {
        if(err) {
            console.log(err);
            if(err.kind === 'ObjectId') {
                return res.status(404).send({message: "productType not found with id " + req.params.productTypeId});
            }

            if(!data) {
                return res.status(404).send({message: "productType not found with id " + req.params.productTypeId});
            }

        }
        res.send(data);
    });
};

exports.update = function(req, res) {
    // Update a productType identified by the productTypeId in the request

    var updates = req.body;
    updates.id = req.params.productTypeId;
    productTypeModel.update(updates, function (err, data) {
        if (err) {
            res.status(500).send({message: "Could not update productType with id " + req.params.productTypeId});
        } else {
            res.send(data);
        }
    });
}


exports.delete = function(req, res) {
    // Delete a productType with the specified productTypeId in the request
    productTypeModel.delete(req.params.productTypeId, function (err, data) {
        if (err) {
            console.log(err);
            if (err.kind === 'ObjectId') {
                return res.status(404).send({message: "productType not found with id " + req.params.productTypeId});
            }
            return res.status(500).send({message: "Could not delete productType with id " + req.params.productTypeId});
        }

        if (!data) {
            return res.status(404).send({message: "productType not found with id " + req.params.productTypeId});
        }
        res.send({message: "Note deleted successfully!"});
    });
}
