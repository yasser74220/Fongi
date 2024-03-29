import 'package:flutter/material.dart';
import 'package:fongi/screens/payment_gateway/components/components.dart';
import 'package:fongi/screens/payment_gateway/personal-info_screen.dart';

import 'package:sizer/sizer.dart';

import '../../components/title_text.dart';
import '../../constants.dart';
import '../../models/products.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key}) : super(key: key);

  Widget _item(products model) {
    return Material(
      child: Container(
        height: 80,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.2,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 80,
                      width: 80,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kTextLightColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Hero(
                                tag: "${model.id}",
                                child: Image.asset(model.image!),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListTile(
                    title: TitleText(
                      text: model.title!,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        TitleText(
                          text: '\$ ',
                          color: Colors.black,
                          fontSize: 12,
                        ),
                        TitleText(
                          text: model.price.toString(),
                          fontSize: 14,
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: kTextLightColor.withAlpha(150),
                          borderRadius: BorderRadius.circular(10)),
                      child: TitleText(
                        text: 'x${model.id}',
                        fontSize: 12,
                      ),
                    )))
          ],
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return TextButton(
      onPressed: () {

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PersonalInfo()
          ),
        );
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(kMainColor),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 30,
        padding: EdgeInsets.symmetric(vertical: 4),
        width: double.infinity,
        child: TitleText(
          text: 'Proceed to Checkout',
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kMainColor,
              elevation: 0,
              title: Text("Shopping Cart"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 76.h,
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container()
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Price"),
                      Text("1450\$"),
                    ],
                  ),
                ),
                _submitButton(context)
              ],
            )
        );
      },

    );
  }
}
