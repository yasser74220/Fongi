import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../components/title_text.dart';
import '../../constants.dart';
import '../../models/products.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key}) : super(key: key);

  Widget _item(Product model) {
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
                                child: Image.asset(model.image),
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
                      text: model.title,
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
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(kMainColor),
      ),
      child: Container(
        alignment: Alignment.center,
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
              height: 700,
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _item(Product(
                        id: 2,
                        title: "Green T-Shirt",
                        price: 234,
                        size: 120,
                        description: dummyText,
                        image: "assets/images/1.png",
                        color: kMainColor)),
                    Divider(
                      thickness: 1,
                      height: 50,
                    ),
                    _item(Product(
                        id: 1,
                        title: "Grey T-Shirt",
                        price: 50,
                        size: 120,
                        description: dummyText,
                        image: "assets/images/3.png",
                        color: kMainColor)),
                    Divider(
                      thickness: 1,
                      height: 50,
                    ),
                    _item(Product(
                        id: 3,
                        title: "Black T-Shirt",
                        price: 200,
                        size: 120,
                        description: dummyText,
                        image: "assets/images/5.png",
                        color: kMainColor)),
                    Divider(
                      thickness: 1,
                      height: 50,
                    ),
                    _item(Product(
                        id: 2,
                        title: "Green T-Shirt",
                        price: 234,
                        size: 120,
                        description: dummyText,
                        image: "assets/images/1.png",
                        color: kMainColor)),
                    Divider(
                      thickness: 1,
                      height: 50,
                    ),
                    _item(Product(
                        id: 1,
                        title: "Grey T-Shirt",
                        price: 50,
                        size: 120,
                        description: dummyText,
                        image: "assets/images/3.png",
                        color: kMainColor)),
                    Divider(
                      thickness: 1,
                      height: 50,
                    ),
                    _item(Product(
                        id: 1,
                        title: "Grey T-Shirt",
                        price: 50,
                        size: 120,
                        description: dummyText,
                        image: "assets/images/3.png",
                        color: kMainColor)),
                    Divider(
                      thickness: 1,
                      height: 50,
                    ),
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
        ));
  }
}
