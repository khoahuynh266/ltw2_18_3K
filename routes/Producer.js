var express = require('express');
var router = express.Router();

var Producer = require('../controllers/Producer');

// Create a new Note
router.post('/Producer', Producer.create);

// Retrieve all Producer
router.get('/Producer', Producer.findAll);

// Retrieve a single Note with noteId
router.get('/Producer/:ProducerId', Producer.findOne);

// Update a Note with ProducerId
router.put('/Producer/:ProducerId', Producer.update);

// Delete a Note with ProducerId
router.delete('/Producer/:ProducerId', Producer.delete);

module.exports = router;
