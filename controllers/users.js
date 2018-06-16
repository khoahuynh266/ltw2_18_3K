var usersModel = require('../models/users');
var jwt = require('jsonwebtoken');
exports.create = function (req, res) {
    // Create and Save a new user
    usersModel.create(req.body, function (err,data) {
        if (err) {
            res.status(400).send(err);
        }
        else{
        res.status(201).send();}
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
    usersModel.findOneById(req.params.id, function(err, data) {
        if(err) {
            console.log(err);
            if(err.kind === 'ObjectId') {
                return res.status(404).send({message: "users not found  " + req.params.id});
            }

            if(!data) {
                return res.status(404).send({message: "users not found  " + req.params.id});
            }

        }
        res.send(data);
    });
};


exports.delete = function(req, res) {
    // Delete a users with the specified userId in the request
    usersModel.delete(req.params.id, function (err, data) {
        if (err) {
            console.log(err);
            if (err.kind === 'ObjectId') {
                return res.status(404).send({message: "users not found with id " + req.params.id});
            }
            return res.status(500).send({message: "Could not delete users with id " + req.params.id});
        }

        if (!data) {
            return res.status(404).send({message: "users not found with id " + req.params.id});
        }
        res.send({message: "Note deleted successfully!"});
    });
}

exports.update = function(req, res) {
    // Update a users identified by the userId in the request

    var user = req.body;
    user.id = req.params.id;
    usersModel.update(user, function (err, data) {
        if (err) {
            res.status(500).send({message: "Could not update users with id " + req.params.id});
        } else {
            res.send(data);
        }
    });
}
