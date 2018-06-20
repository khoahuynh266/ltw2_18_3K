var OderListModel = require('../models/OderList');
exports.create = function (req, res) {
    // Create and Save a new product
    OderListModel.create(req.body, function (err,data) {
        if (err) {
            res.status(400).send(err);
            return;
        }
        res.status(201).send();
    })
};

exports.findAll = function (req, res) {
    // Retrieve and return all notes from the database.
    OderListModel.findAll(function (err, data) {
            if (err) {
                res.status(400).send(err);
                return;
            }
            res.send(data);
        }
    );
};

exports.getOderListByProducer = function(req, res) {
    // Find a single OderList with a productId
    OderListModel.getOderListByProducer(req.params.id_nsx, function(err, data) {
        if(err) {
            console.log(err);
            if(err.kind === 'ObjectId') {
                return res.status(404).send({message: "OderList not found with id " + req.params.id_nsx});
            }

            if(!data) {
                return res.status(404).send({message: "OderList not found with id " + req.params.id_nsx});
            }

        }
        res.send(data);
    });
};


exports.findOne = function(req, res) {
    // Find a single OderList with a productId
    OderListModel.findOne(req.params.productId, function(err, data) {
        if(err) {
            console.log(err);
            if(err.kind === 'ObjectId') {
                return res.status(404).send({message: "OderList not found with id " + req.params.productId});
            }

            if(!data) {
                return res.status(404).send({message: "OderList not found with id " + req.params.productId});
            }

        }
        res.send(data);
    });
};

exports.update = function(req, res) {
    // Update a OderList identified by the productId in the request

    var updates = req.body;
    updates.id = req.params.productId;
    OderListModel.update(updates, function (err, data) {
        if (err) {
            res.status(500).send({message: "Could not update OderList with id " + req.params.productId});
        } else {
            res.send(data);
        }
    });
}


exports.delete = function(req, res) {
    // Delete a OderList with the specified productId in the request
    OderListModel.delete(req.params.productId, function (err, data) {
        if (err) {
            console.log(err);
            if (err.kind === 'ObjectId') {
                return res.status(404).send({message: "OderList not found with id " + req.params.productId});
            }
            return res.status(500).send({message: "Could not delete OderList with id " + req.params.productId});
        }

        if (!data) {
            return res.status(404).send({message: "OderList not found with id " + req.params.productId});
        }
        res.send({message: "Note deleted successfully!"});
    });
}