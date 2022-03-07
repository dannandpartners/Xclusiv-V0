import 'package:flutter/material.dart';
import 'package:xclusiv/data/shop_categories.dart';
import 'package:xclusiv/widgets/shop_category_widget.dart';
import 'package:xclusiv/widgets/customshake.dart';

class ShopCategoriesWidget extends StatefulWidget {
  @override
  _ShopCategoriesWidgetState createState() => _ShopCategoriesWidgetState();
}

class _ShopCategoriesWidgetState extends State<ShopCategoriesWidget> {
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: pageController,
              itemCount: shopCategories.length,
              itemBuilder: (context, index) {
                final shopCategory = shopCategories[index];

                if (pageIndex == index) {
                  return LeftRightShake(
                      child: ShopCategoryWidget(shopCategory: shopCategory));
                } else {
                  return RightLeftShake(
                      child: ShopCategoryWidget(shopCategory: shopCategory));
                }

                //return ShopCategoryWidget(shopCategory: shopCategory);
              },
              onPageChanged: (index) => setState(() => pageIndex = index),
            ),
          ),
          SizedBox(height: 12)
        ],
      );
}
