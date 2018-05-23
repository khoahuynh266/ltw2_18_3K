var express = require('express');
var router = express.Router();
var loginController= require('../controllers/login');
var passport = require('passport');
router.post('/login',loginController.login)
router.get('/secret', passport.authenticate('jwt', { session: false }),loginController.secret)
module.exports = router;
