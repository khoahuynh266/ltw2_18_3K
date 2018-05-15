var usersModel = require('../models/users');
exports.create = function (req, res) {
    // Create and Save a new user
    usersModel.create(req.body, function (err,data) {
        if (err) {
            res.status(400).send(err);
            return;
        }
        res.status(201).send();
    })
};

exports.findAll = function (req, res) {
    // Retrieve and return all notes from the database.
    usersModel.findAll(function (err, data) {
            if (err) {
                res.status(400).send(err);
                return;
            }
            res.send(data);
        }
    );
};


exports.findOne = function(req, res) {
    // Find a single users with a userId
    usersModel.findOne(req.params.userId, function(err, data) {
        if(err) {
            console.log(err);
            if(err.kind === 'ObjectId') {
                return res.status(404).send({message: "users not found with id " + req.params.userId});
            }

            if(!data) {
                return res.status(404).send({message: "users not found with id " + req.params.userId});
            }

        }
        res.send(data);
    });
};

exports.update = function(req, res) {
    // Update a users identified by the userId in the request

    var updates = req.body;
    updates.id = req.params.userId;
    usersModel.update(updates, function (err, data) {
        if (err) {
            res.status(500).send({message: "Could not update users with id " + req.params.userId});
        } else {
            res.send(data);
        }
    });
}


exports.delete = function(req, res) {
    // Delete a users with the specified userId in the request
    usersModel.delete(req.params.userId, function (err, data) {
        if (err) {
            console.log(err);
            if (err.kind === 'ObjectId') {
                return res.status(404).send({message: "users not found with id " + req.params.userId});
            }
            return res.status(500).send({message: "Could not delete users with id " + req.params.userId});
        }

        if (!data) {
            return res.status(404).send({message: "users not found with id " + req.params.userId});
        }
        res.send({message: "Note deleted successfully!"});
    });
}
