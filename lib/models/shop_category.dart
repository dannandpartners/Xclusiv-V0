import 'package:xclusiv/models/shopping_filter.dart';

class ShopCategory {
  final String name;
  final String urlImage;
  final String description;
  final List<ShoppingFilter> shoppingFilters;

  ShopCategory({
    this.shoppingFilters,
    this.name,
    this.urlImage,
    this.description,
  });
}
