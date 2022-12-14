import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fongi/cubit/cubit.dart';
import 'package:fongi/cubit/states.dart';

import '../../../constants.dart';
import '../../details/details_screen.dart';
import 'body.dart';
import 'item_card.dart';

// We need satefull widget for our categories

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["T_shirts", "Footwear", "Watches"];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override 
  
  Widget build(BuildContext context) {
    return BlocConsumer<EcommerceCubit, EcommerceStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = EcommerceCubit.get(context);

    return Column(
      children: [
        Container(
          color: kMainColor,
          child: TabBar(
            indicatorColor: Colors.white,

               tabs: [
                Tab(
                  text: "T-Shirt",
                ),
                Tab(
                  text: "Footwear",

                ),
                Tab(
                  text: "Watches",
                ),
              ]
          ),
        ),
        Expanded(
          child: TabBarView(
               children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Body(),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child:Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: GridView.builder(
                      itemCount: cubit.foot.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: kDefaultPadding,
                        crossAxisSpacing: kDefaultPadding,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) => ItemCard(
                        product:cubit.foot[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(

                                product: cubit.foot[index],
                              ),
                            )),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: GridView.builder(
                    itemCount: cubit.Watches.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: kDefaultPadding,
                      crossAxisSpacing: kDefaultPadding,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                      product:cubit.Watches[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(

                              product: cubit.Watches[index],
                            ),
                          )),
                    )),
              ),
            ),

          ]),
        ),
      ],
    );
  },
);
  }
}