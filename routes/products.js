var express = require('express');
var router = express.Router();

var products = require('../controllers/products');
var passport = require('passport');

// Create a new Note
router.post('/products',passport.authenticate('jwt', {session: false}), products.create);

// Retrieve all products
router.get('/products', products.findAll);

// Retrieve a single Note with noteId
router.get('/products/:productId', products.findOne);

// Update a Note with productId
router.put('/products/:productId',passport.authenticate('jwt', {session: false}), products.update);

// Delete a Note with productId
router.delete('/products/:productId',passport.authenticate('jwt', {session: false}), products.delete);
//DS sp xem nhiều
router.get('/bestview', products.bestview);

router.get('/newest', products.newest);

router.get('/bestseller', products.bestseller);

router.get('/products/search/:QueryStr',products.Search);

router.get('/products/page/:pageNumber', products.getProductPage);

router.get('/products/totalPage/', products.getTotalPage);

router.get('/products/Producer/:id_nsx', products.getProductsByProducer)

router.get('/products/ProductType/:id_type', products.getProductsByProductType)

//lấy 5 sp theo nsx
router.get('/products/5productSamProducer/:producerID', products.productSamProducer);
//lấy 5 sp theo loại
router.get('/products/5productSamType/:typeID', products.productSamType);
// tăng lượt xem
router.get('/products/UpdateView/:id', products.UpdateView);

module.exports = router;
