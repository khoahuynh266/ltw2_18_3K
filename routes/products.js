var express = require('express');
var router = express.Router();

var products = require('../controllers/products');

// Create a new Note
router.post('/products', products.create);

// Retrieve all products
router.get('/products', products.findAll);

// Retrieve a single Note with noteId
router.get('/products/:productId', products.findOne);

// Update a Note with productId
router.put('/products/:productId', products.update);

// Delete a Note with productId
router.delete('/products/:productId', products.delete);
//DS sp xem nhiều
router.get('/bestview', products.bestview);

router.get('/newest', products.newest);

router.get('/bestseller', products.bestseller);

router.get('/products/search/:QueryStr',products.Search);

router.get('/products/page/:pageNumber', products.getProductPage);

router.get('/products/totalPage/', products.getTotalPage);
module.exports = router;
