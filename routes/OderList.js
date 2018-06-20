var express = require('express');
var router = express.Router();

var OderList = require('../controllers/OderList');

// Create a new Note
router.post('/OderList', OderList.create);

// Retrieve all OderList
router.get('/OderList', OderList.findAll);

// Retrieve a single Note with noteId
router.get('/OderList/:OderListId', OderList.findOne);

// Update a Note with OderListId
router.put('/OderList/:OderListId', OderList.update);

// Delete a Note with OderListId
router.delete('/OderList/:OderListId', OderList.delete);

module.exports = router;