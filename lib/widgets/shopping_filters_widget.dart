import 'package:flutter/material.dart';
import 'package:xclusiv/models/shop_category.dart';
import 'package:xclusiv/models/shopping_filter.dart';

class ShoppingFiltersWidget extends StatelessWidget {
  final ShopCategory shopCategory;
  final Animation animation;

  const ShoppingFiltersWidget({
    @required this.shopCategory,
    @required this.animation,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
      itemCount: shopCategory.shoppingFilters.length,
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final shoppingFilter = shopCategory.shoppingFilters[index];

        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) => FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Interval(0.2, 1, curve: Curves.easeInExpo),
            ),
            child: child,
          ),
          child: buildShoppingFilter(shoppingFilter),
        );
      });

  Widget buildShoppingFilter(ShoppingFilter shoppingFilter) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black12,
                  backgroundImage: AssetImage(shoppingFilter.urlImage),
                ),
                Text(
                  shoppingFilter.filterName,
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(),
              ],
            ),
            Text(
              shoppingFilter.description,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      );
}
