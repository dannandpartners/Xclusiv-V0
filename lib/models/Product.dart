// Our demo Products
import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/product1.jpg",
      "assets/images/product1.jpg",
      "assets/images/product1.jpg",
      "assets/images/product1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "All new Fabric Women shoes- Louis Vuitton",
    price: 300.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/product2.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "MultiColoured Makeup Kit - By Dandy & Barby",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/product3.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Awesome children sunglasses - By Doodoo kids fashion",
    price: 6.99,
    description: description,
    rating: 4.8,
    isFavourite: false,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/product4.jpg",
      "assets/images/product4.jpg",
      "assets/images/product4.jpg",
      "assets/images/product4.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Awesome children sunglasses - By Doodoo kids fashion",
    price: 6.5,
    description: description,
    rating: 4.1,
    isPopular: true,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
