var express = require('express');
var router = express.Router();
var UserController = require('../controllers/users');
 //var passport = require('./../middleware/passport')
var passport = require('passport');
/* GET home page. */
router.get('/', function(req, res, next) {
    res.json({status:"success", message:"Parcel Pending API", data:{"version_number":"v1.0.0"}})
});


router.post('/users',           UserController.create);                                                    // C
router.get('/users', passport.authenticate('jwt', { session: false }), UserController.findAll);        // R
router.get('/users/:id', passport.authenticate('jwt', { session: false }), UserController.findOne);
 router.put('/users', passport.authenticate('jwt', { session: false }), UserController.update);     // U
 router.delete('/users', passport.authenticate('jwt', { session: false }), UserController.delete);     // D





module.exports = router;
