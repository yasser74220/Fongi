import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fongi/screens/home/components/body.dart';
import 'package:fongi/screens/home/components/categories.dart';
import '../../constants.dart';
import '../search/search_screen.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: buildAppBar(  context),
          body: Categories()
      ),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kMainColor ,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      ),
      title: Center(child: Text(
        "    Fongi",
        style: TextStyle(

            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Pacifico'
        ),
      )),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () { Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SearchScreen()
            ),
          );   },
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}