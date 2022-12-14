const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser')
var paypal = require('paypal-rest-sdk');

const app = express();

mongoose.set('strictQuery', true);

app.use(bodyParser.json());

const productsRoute = require('./routes/products');

app.use('/products', productsRoute);

//Routes
app.get('/', (req, res) => {
    res.send('We are on home');
});

mongoose.connect('mongodb+srv://fruine:123@login.wiwyw3r.mongodb.net/ecommerce?retryWrites=true&w=majority', { useNewUrlparser: true }, () => {
    console.log('Connected to db!')
}
);


paypal.configure({
    'mode': 'sandbox', //sandbox or live
    'client_id': 'AZ9pemZgL-hopEvEaikdOeK0r6oS1a8l_wQKtHWD4_kDmnDH3wYUEKBVHJ5dFx9ZDf4tlJL-so5ASpnL',
    'client_secret': 'EDtZ-KfOV8SrRedsleX19vuYfCPu9VAO29wAikML9-91zTDgRBCH9rXK1IrfqherWmZvE0d-Fe4oqu2L'
  });

app.get('/pay',(req, res) => {
    var create_payment_json = {
        "intent": "sale",
        "payer": {
            "payment_method": "paypal"
        },
        "redirect_urls": {
            "return_url": "http://localhost:8000/success",
            "cancel_url": "http://cancel.url"
        },
        "transactions": [{
            "item_list": {
                "items": [{
                    "name": "item",
                    "sku": "item",
                    "price": "100.00",
                    "currency": "USD",
                    "quantity": 1
                }]
            },
            "amount": {
                "currency": "USD",
                "total": "100.00"
            },
            "description": "This is the payment description."
        }]
    };


    paypal.payment.create(create_payment_json, (error, payment) => {
        if (error) {
            throw error;
        } else {
            console.log("Create Payment Response");
            console.log(payment);

            for(let i=0; i<payment.links.length; i++)
            {
                if(payment.links[i].rel === 'approval_url' )
                {
                    res.redirect(payment.links[i].href);
                }
            }

        }
    });
})

app.get('/success', (req, res)=>
{

    var execute_payment_json = {
        "payer_id": req.query.PayerID,
        "transactions": [{
            "amount": {
                "currency": "USD",
                "total": "100.00"
            }
        }]
    };

    var paymentId = req.query.paymentId;

    paypal.payment.execute(paymentId, execute_payment_json, function (error, payment) {
        if (error) {
            console.log(error.response);
            throw error;
        } else {
            console.log("Get Payment Response");
            console.log(JSON.stringify(payment));
        }
    });

})


//Start the server
app.listen(3000);