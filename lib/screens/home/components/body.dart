import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fongi/cubit/cubit.dart';
import 'package:fongi/cubit/states.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../models/products.dart';
import '../../details/details_screen.dart';
import 'categories.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EcommerceCubit, EcommerceStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = EcommerceCubit.get(context);

    return Sizer(
      builder: (context, orientation, deviceType) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: GridView.builder(
                  itemCount: cubit.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPadding,
                    crossAxisSpacing: kDefaultPadding,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    product:cubit.data[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(

                            product: cubit.data[index],
                          ),
                        )),
                  )),
            ),
          ),
        ],
      ),

    );
  },
);
  }
}