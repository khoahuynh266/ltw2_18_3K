var usersModel = require('../models/users');
var jwt = require('jsonwebtoken');
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

exports.login = function(req,res) {

    if (req.body.email && req.body.password) {
        var email = req.body.email;
        var password = req.body.password;
    }

    // usually this would be a database call:
    var user = usersModel.findOne(req.body.email, function (err, data) {
        if (err) {
            console.log(err);
            if (err.kind === 'ObjectId') {
                return res.status(404).send({message: "users not found  " + req.params.email});
            }
        }
        res.send(data);
    });


    if (!user) {
        return res.status(401).json({message: "no such user found"});
    }

    else {
        if (data.password === password) {
            // from now on we'll identify the user by the id and the id is the only personalized value that goes into our token
            var payload = {id: data.id};
            var token = jwt.sign(payload, jwtOptions.secretOrKey);
            return res.json({message: "ok", token: token});
        } else {
            return res.status(401).json({message: "passwords did not match"});
        }
    }
}

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


exports.create = async function(req, res){
    res.setHeader('Content-Type', 'application/json');
    const body = req.body;

    if(!body.unique_key && !body.email && !body.phone){
        return ReE(res, 'Please enter an email or phone number to register.');
    } else if(!body.password){
        return ReE(res, 'Please enter a password to register.');
    }else{
        let err, user;

        [err, user] = await to(authService.createUser(body));

        if(err) return ReE(res, err, 422);
        return ReS(res, {message:'Successfully created new user.', user:user.toWeb(), token:user.getJWT()}, 201);
    }
}

exports.get = async function(req, res){
    res.setHeader('Content-Type', 'application/json');
    let user = req.user;

    return ReS(res, {user:user.toWeb()});
}

exports.update = async function(req, res){
    let err, user, data
    user = req.user;
    data = req.body;
    user.set(data);

    [err, user] = await to(user.save());
    if(err){
        if(err.message=='Validation error') err = 'The email address or phone number is already in use';
        return ReE(res, err);
    }
    return ReS(res, {message :'Updated User: '+user.email});
}

exports.remove = async function(req, res){
    let user, err;
    user = req.user;

    [err, user] = await to(user.destroy());
    if(err) return ReE(res, 'error occured trying to delete user');

    return ReS(res, {message:'Deleted User'}, 204);
}


//
// exports.login = async function(req, res){
//     const body = req.body;
//     let err, user;
//
//     [err, user] = await to(authService.authUser(req.body));
//     if(err) return ReE(res, err, 422);
//
//     return ReS(res, {token:user.getJWT(), user:user.toWeb()});
// }
