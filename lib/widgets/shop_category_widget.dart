import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xclusiv/models/shop_category.dart';
import 'package:xclusiv/pages/detail_page.dart';
import 'package:xclusiv/widgets/image_widget.dart';

class ShopCategoryWidget extends StatefulWidget {
  final ShopCategory shopCategory;

  const ShopCategoryWidget({
    @required this.shopCategory,
    Key key,
  }) : super(key: key);

  @override
  _ShopCategoryWidgetState createState() => _ShopCategoryWidgetState();
}

class _ShopCategoryWidgetState extends State<ShopCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 50),
      child: GestureDetector(
        onTap: openDetailPage,
        child: ImageWidget(shopCategory: widget.shopCategory),
      ),
    );
  }

  void openDetailPage() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        reverseTransitionDuration: Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Interval(0, 0.5),
          );

          return FadeTransition(
            opacity: curvedAnimation,
            child: DetailPage(
                shopCategory: widget.shopCategory, animation: animation),
          );
        },
      ),
    );
  }
}
