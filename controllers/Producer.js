var ProducerModel = require('../models/Producer')

exports.create = function (req, res) {
    // Create and Save a new product
    ProducerModel.create(req.body, function (err,data) {
        if (err) {
            res.status(400).send(err);
            return;
        }
        res.status(201).send();
    })
};

exports.findAll = function (req, res) {
    // Retrieve and return all notes from the database.
    ProducerModel.findAll(function (err, data) {
            if (err) {
                res.status(400).send(err);
                return;
            }
            res.send(data);
        }
    );
};


exports.findOne = function(req, res) {
    // Find a single Producer with a ProducerId
    ProducerModel.findOne(req.params.ProducerId, function(err, data) {
        if(err) {
            console.log(err);
            if(err.kind === 'ObjectId') {
                return res.status(404).send({message: "Producer not found with id " + req.params.ProducerId});
            }

            if(!data) {
                return res.status(404).send({message: "Producer not found with id " + req.params.ProducerId});
            }

        }
        res.send(data);
    });
};


exports.update = function(req, res) {
    // Update a Producer identified by the ProducerId in the request

    var updates = req.body;
    updates.id = req.params.ProducerId;
    ProducerModel.update(updates, function (err, data) {
        if (err) {
            res.status(500).send({message: "Could not update Producer with id " + req.params.ProducerId});
        } else {
            res.send(data);
        }
    });
}


exports.delete = function(req, res) {
    // Delete a Producer with the specified ProducerId in the request
    ProducerModel.delete(req.params.ProducerId, function (err, data) {
        if (err) {
            console.log(err);
            if (err.kind === 'ObjectId') {
                return res.status(404).send({message: "Producer not found with id " + req.params.ProducerId});
            }
            return res.status(500).send({message: "Could not delete Producer with id " + req.params.ProducerId});
        }

        if (!data) {
            return res.status(404).send({message: "Producer not found with id " + req.params.ProducerId});
        }
        res.send({message: "Note deleted successfully!"});
    });
}
