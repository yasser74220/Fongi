import 'package:flutter/material.dart';
import 'package:fongi/constants.dart';
import 'package:fongi/screens/payment_gateway/components/components.dart';


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
                  Text('1,250 EGP',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kMainColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  defaultFormField(
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
                        child: defaultFormField(
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
                        child: defaultFormField(
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
                  defaultFormField(
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
                  defaultButton(
                      text: 'pay now',
                      function: (){
                        if (paymentFormKey.currentState!.validate())
                        {
                          print("Success");
                        }
                      },
                    radius: 10
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
