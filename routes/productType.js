var express = require('express');
var router = express.Router();

var productType = require('../controllers/productType');

// Create a new Note
router.post('/productType', productType.create);

// Retrieve all productType
router.get('/productType', productType.findAll);

// Retrieve a single Note with noteId
router.get('/productType/:productTypeId', productType.findOne);

// Update a Note with productTypeId
router.put('/productType/:productTypeId', productType.update);

// Delete a Note with productTypeId
router.delete('/productType/:productTypeId', productType.delete);

module.exports = router;
