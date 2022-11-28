import 'package:flutter/material.dart';

import '../constants.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "green t_shirt",
      price: 234,
      size: 120,
      description: dummyText,
      image: "assets/images/1.png",
      color: kMainColor),
  Product(
      id: 2,
      title: "green t_shirt",
      price: 234,
      size: 120,
      description: dummyText,
      image: "assets/images/2.png",
      color: kMainColor),
  Product(
      id: 3,
      title: "green t_shirt",
      price: 234,
      size: 100,
      description: dummyText,
      image: "assets/images/3.png",
      color:kMainColor),
  Product(
      id: 4,
      title: "green t_shirt",
      price: 234,
      size: 110,
      description: dummyText,
      image: "assets/images/4.png",
      color: kMainColor),
  Product(
      id: 5,
      title: "green t_shirt",
      price: 234,
      size: 120,
      description: dummyText,
      image: "assets/images/5.png",
      color: kMainColor),
  Product(
    id: 6,
    title: "green t_shirt",
    price: 234,
    size: 120,
    description: dummyText,
    image: "assets/images/6.png",
    color: kMainColor,
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
