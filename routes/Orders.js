var express = require('express');
var router = express.Router();

var orders = require('../controllers/Orders');

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

router.get('/orders', passport.authenticate('jwt', { session: false }),orders.findAll);

router.delete('/orders/:ID', passport.authenticate('jwt', { session: false }),orders.DelOne);

router.get('/orders/:ID',orders.Detail);
	
router.put('/orders/:ID',passport.authenticate('jwt', { session: false }),orders.UpdateStatusOrder);

router.post('/Pay/',passport.authenticate('jwt', { session: false }),orders.Pay);

router.post('/PurchaseHistory/',passport.authenticate('jwt', { session: false }),orders.PurchaseHistory);
  
module.exports = router;