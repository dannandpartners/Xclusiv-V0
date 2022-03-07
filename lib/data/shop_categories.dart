import 'package:xclusiv/data/shopping_filters.dart';
import 'package:xclusiv/models/shop_category.dart';

List<ShopCategory> shopCategories = [
  ShopCategory(
    name: 'NEW IN',
    urlImage: 'assets/images/newin.jpg',
    description: 'Explore Newly Added Items',
    shoppingFilters: ShoppingFilters.allShoppingFilters,
  ),
  ShopCategory(
    name: 'MEN',
    urlImage: 'assets/images/men1.jpg',
    description: 'Explore Featured Men Fashion',
    shoppingFilters: ShoppingFilters.allShoppingFilters,
  ),
  ShopCategory(
    name: 'WOMEN',
    urlImage: 'assets/images/women1.jpg',
    description: 'Explore Featured Women Fashion',
    shoppingFilters: ShoppingFilters.allShoppingFilters,
  ),
  ShopCategory(
    name: 'KIDS',
    urlImage: 'assets/images/kids1.jpg',
    description: 'Explore Featured Kids Fashion',
    shoppingFilters: ShoppingFilters.allShoppingFilters,
  ),
  ShopCategory(
    name: 'SERVICES',
    urlImage: 'assets/images/services1.jpg',
    description: 'Explore Featured Event Services',
    shoppingFilters: ShoppingFilters.allShoppingFilters,
  ),
  ShopCategory(
    name: 'BRANDS',
    urlImage: 'assets/images/brands1.jpg',
    description: 'Explore Featured Brands',
    shoppingFilters: ShoppingFilters.allShoppingFilters,
  ),
  ShopCategory(
    name: 'SALES',
    urlImage: 'assets/images/sales1.jpg',
    description: 'Explore awesome deals and discounts',
    shoppingFilters: ShoppingFilters.allShoppingFilters,
  ),
];
