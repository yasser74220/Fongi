import 'package:flutter/material.dart';
import 'package:fongi/models/products.dart';

import '../../constants.dart';
import '../details/details_screen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();
  List<Product> allproducts = products;
  List<Product> listpro = products;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
        title: Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: TextField(
                controller: searchController,
                maxLines: 1,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kMainColor)),
                    hintText: "Search for a product",
                    prefixIcon: Icon(Icons.search, color: kMainColor),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kMainColor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: kMainColor))),
                onChanged: searchProduct,

              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: allproducts.length,
                    itemBuilder: (context, index) {
                      final product = allproducts[index];
                      return ListTile(
                        leading:
                            Image.asset(product.image, width: 50, height: 50),
                        title: Text(product.title),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  product: products[index],
                                ),
                              ));
                        },
                      );
                    }))
          ],
        ),
      ),
    );
  }

  void searchProduct(String query) {
    final filter = listpro.where((product) {
      final productTitle = product.title.toLowerCase();
      final input = query.toLowerCase();
      return productTitle.contains(input);
    }).toList();
    setState(() {
      allproducts = filter;
    });
  }
}
