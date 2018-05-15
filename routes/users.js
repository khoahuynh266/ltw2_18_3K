var express = require('express');
var router = express.Router();

var users = require('../controllers/users');

// Create a new Note
router.post('/users', users.create);

// Retrieve all users
router.get('/users', users.findAll);

// Retrieve a single Note with noteId
router.get('/users/:userId', users.findOne);

// Update a Note with userId
router.put('/users/:userId', users.update);

// Delete a Note with userId
router.delete('/users/:userId', users.delete);

module.exports = router;
