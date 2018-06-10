var express = require('express');
var router = express.Router();

var products = require('../controllers/products');

// Create a new Note
router.post('/products', products.create);

// Retrieve all products
router.get('/products', products.findAll);

// Retrieve a single Note with noteId
router.get('/products/:productId', products.findOne);

router.get('/products/:productIdNSX', products.findAllProduct_Type);

// Update a Note with productId
router.put('/products/:productId', products.update);

// Delete a Note with productId
router.delete('/products/:productId', products.delete);

module.exports = router;
