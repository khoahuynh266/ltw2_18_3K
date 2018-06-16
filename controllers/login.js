var LoginModel = require('../models/login');
var md5 = require('md5');

var jwt = require('jsonwebtoken');
var passport = require("passport");
var passportJWT = require("passport-jwt");

var ExtractJwt = passportJWT.ExtractJwt;
var JwtStrategy = passportJWT.Strategy;

var jwtOptions = {}
jwtOptions.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
jwtOptions.secretOrKey = 'tasmanianDevil123';

var strategy = new JwtStrategy(jwtOptions, function (jwt_payload, next) {
    console.log('payload received', jwt_payload);
    next(null, jwt_payload)
});

passport.use(strategy);
var permission = null;
var id = null;


exports.login = function (req, res) {

    LoginModel.findUser(req.body,function (err, data) {
            if (err) {
                res.status(401).send(err);
                return ;
            }
            else {
                if (data) {
                    permission = data[0].type;
                    id = data[0].id;

                    var payload = {email: req.body.email};
                    var token = jwt.sign(payload, jwtOptions.secretOrKey);
                    res.json({message: "ok", token: token});
                    console.log(token);
                    res.status(201).send();
                }
                else {
                    res.json({err: "error"});
                    res.status(400).send();
                }
            }
        }
    );

};

exports.secret = function(req,res){
    res.json({permission : permission ,id: id});
    res.status(200).send();
};