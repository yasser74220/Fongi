import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:fongi/constants.dart';
import 'package:fongi/screens/payment_gateway/components/DefaultButton.dart';
import 'package:fongi/screens/payment_gateway/components/defaultFormField.dart';


class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var cardNumberController = TextEditingController();

  var expirationDateController = TextEditingController();

  var cvvController = TextEditingController();

  var cardHolderNameController = TextEditingController();

  var paymentFormKey = GlobalKey<FormState>();

  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    double price = 1250;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kMainColor,
          title: const Text('Payment')
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: paymentFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/orangecard.png',
                      height: 289,
                    ),
                  ),
                  const Text(
                    'Total price',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('$price USD',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kMainColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultFormField(
                    controller: cardNumberController,
                    label: 'Card NO',
                    inputType: TextInputType.text,
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Enter your card Number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DefaultFormField(
                          controller: expirationDateController,
                          label: 'MM/YY',
                          inputType: TextInputType.text,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'Enter Expiration date';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: DefaultFormField(
                          controller: cvvController,
                          label: 'CVV',
                          inputType: TextInputType.text,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'Enter your CVV';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultFormField(
                    controller: cardHolderNameController,
                    label: 'Holder name',
                    inputType: TextInputType.text,
                    validate: (value){
                      if(value == '' ||value!.isEmpty){
                        return 'Enter the holder name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text('Save card data for future payments',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600]
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            isSaved = !isSaved;
                          });
                        },
                        icon: isSaved ? const Icon(Icons.radio_button_checked_rounded) : const Icon(Icons.radio_button_off_rounded),
                        splashRadius: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultButton(
                    text: 'Pay Now' ,
                    function: (){
                      {
                        if(paymentFormKey.currentState!.validate())
                        {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => UsePaypal(
                                  sandboxMode: true,
                                  clientId:
                                  "AZ9pemZgL-hopEvEaikdOeK0r6oS1a8l_wQKtHWD4_kDmnDH3wYUEKBVHJ5dFx9ZDf4tlJL-so5ASpnL",
                                  secretKey:
                                  "EDtZ-KfOV8SrRedsleX19vuYfCPu9VAO29wAikML9-91zTDgRBCH9rXK1IrfqherWmZvE0d-Fe4oqu2L",
                                  returnURL: "http://localhost:8000/success",
                                  cancelURL: "https://samplesite.com/cancel",
                                  transactions: [
                                    {
                                      "amount": {
                                        "total": price,
                                        "currency": "USD",
                                        "details": {
                                          "subtotal": price,
                                          "shipping": '0',
                                          "shipping_discount": 0
                                        }
                                      },
                                      "description":
                                      "The payment transaction description.",
                                      "item_list": {
                                        "items": [
                                          {
                                            "name": "A demo product",
                                            "quantity": 1,
                                            "price": price,
                                            "currency": "USD"
                                          }
                                        ],

                                        // shipping address is not required though
                                        "shipping_address": const {
                                          "recipient_name": 'Joe Doe',
                                          "line1": "Travis County",
                                          "line2": "",
                                          "city": "Austin",
                                          "country_code": "US",
                                          "postal_code": "73301",
                                          "phone": "+00000000",
                                          "state": "Texas"
                                        },
                                      }
                                    }
                                  ],
                                  note: "Contact us for any questions on your order.",
                                  onSuccess: (Map params) async {
                                    if (kDebugMode) {
                                      print("onSuccess: $params");
                                    }
                                  },
                                  onError: (error) {
                                    if (kDebugMode) {
                                      print("onError: $error");
                                    }
                                  },
                                  onCancel: (params) {
                                    if (kDebugMode) {
                                      print('cancelled: $params');
                                    }
                                  }),
                            ),
                          );
                        }
                      }
                    },
                    radius: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}