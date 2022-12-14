const express = require('express');
const router = express.Router();
const Product = require('../models/product');


router.post('/addproduct', async (req, res) => {
    const product = new Product({
        title: req.body.title,
        description: req.body.description,
        price: req.body.price,
        size: req.body.size,
        color: req.body.color,
        image: req.body.image,
    });

    const savedProduct = await product.save()
        .then(data => {
            res.json(data);
        })
        .catch(err => {
            res.json({ message: err });
        });
});

router.get('/', async (req, res) => {
    const posts = await Product.find();
    res.json(posts);
})

router.patch('/:productId', async (req, res) => {
    const updatedProduct = await Product.updateOne({
        _id: req.params.productId,
    },
        {
            $set: {
                title: req.body.title,
                description: req.body.description,
                price: req.body.price,
                size: req.body.size,
                color: req.body.color,
                image: req.body.image,
            }

        })
    res.json(updatedProduct);
})

router.delete('/:productId' ,async (req,res) => {
    const deletedProduct = await Product.remove({
        _id: req.params.productId
        
    })
    res.json(deletedProduct);
})


module.exports = router;