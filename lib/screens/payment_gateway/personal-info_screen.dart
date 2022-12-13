import 'package:flutter/material.dart';
import 'package:fongi/constants.dart';
import 'package:fongi/screens/payment_gateway/components/components.dart';
import 'package:fongi/screens/payment_gateway/components/defaultFormField.dart';
import 'package:fongi/screens/payment_gateway/payment_screen.dart';


class PersonalInfo extends StatelessWidget {
   PersonalInfo({Key? key}) : super(key: key);

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: const Center(child: Text('Payment Gateway')),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personal Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ) ,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultFormField(
                      controller: firstNameController,
                      label: 'First name',
                      inputType: TextInputType.text,
                      validate: (value){
                        if(value!.isEmpty){
                          return 'Enter your first name';
                        }
                        return null;
                      },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultFormField(
                    controller: lastNameController,
                    label: 'Last name',
                    inputType: TextInputType.text,
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultFormField(
                    controller: addressController,
                    label: 'Address',
                    inputType: TextInputType.text,
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Enter your Address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultFormField(
                    controller: phoneController,
                    label: 'Phone',
                    inputType: TextInputType.text,
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Enter your Phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: kMainColor,
                        radius: 30,
                        child: IconButton(
                            onPressed: (){
                              if (formKey.currentState!.validate())
                              {
                                navigateTo(context, Payment());
                              }
                            },
                          icon: const Icon(
                                Icons.arrow_forward_ios_rounded
                            ),
                          color: Colors.white,
                          iconSize: 25,
                          splashRadius: 25,
                        ),
                      ),
                    ],
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
