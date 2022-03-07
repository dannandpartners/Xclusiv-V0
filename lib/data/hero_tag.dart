import 'package:xclusiv/models/shop_category.dart';

class HeroTag {
  static String image(String urlImage) => urlImage;

  static String description(ShopCategory shopCategory) =>
      shopCategory.name + shopCategory.description;
}
