var express = require('express');
var router = express.Router();
var UserController = require('../controllers/users');
 //var passport = require('./../middleware/passport')
var passport = require('passport');
/* GET home page. */
router.get('/', function(req, res, next) {
    res.json({status:"success", message:"Parcel Pending API", data:{"version_number":"v1.0.0"}})
});


router.post('/users',    UserController.create);                                                    // C
router.get('/users',  UserController.findAll);        // R
router.get('/users/:id', UserController.findOne);
 router.put('/users', passport.authenticate('jwt', { session: false }), UserController.update);     // U
 router.delete('/users/:id',  UserController.delete);     // D





module.exports = router;
