import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fongi/screens/cart/shopping_cart.dart';
import 'package:fongi/screens/details/component/body.dart';
import 'package:fongi/screens/search/search_screen.dart';
import '../../constants.dart';
import '../../models/products.dart';


class DetailsScreen extends StatelessWidget {
   final products product;

  const DetailsScreen({Key? key,  required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: kMainColor,
      appBar: buildAppBar(context),
      body: Body(product:product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor:kMainColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () => Navigator.push(context , MaterialPageRoute(builder: (context) => SearchScreen(),)),
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () => Navigator.push(context , MaterialPageRoute(builder: (context) => ShoppingCartPage(),)),
        ),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
