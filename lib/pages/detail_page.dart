import 'package:flutter/material.dart';
import 'package:xclusiv/data/hero_tag.dart';
import 'package:xclusiv/models/shop_category.dart';
import 'package:xclusiv/widgets/detailed_info_widget.dart';
import 'package:xclusiv/widgets/hero_widget.dart';
import 'package:xclusiv/widgets/shopping_filters_widget.dart';

class DetailPage extends StatelessWidget {
  final ShopCategory shopCategory;
  final Animation animation;

  const DetailPage({
    @required this.shopCategory,
    @required this.animation,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(shopCategory.name),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: Navigator.of(context).pop,
            ),
            SizedBox(width: 10)
          ],
          leading: Icon(Icons.search_outlined),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox.expand(
                    child: HeroWidget(
                      tag: HeroTag.image(shopCategory.urlImage),
                      child:
                          Image.asset(shopCategory.urlImage, fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
            DetailedInfoWidget(shopCategory: shopCategory),
            Expanded(
              flex: 5,
              child: ShoppingFiltersWidget(
                  shopCategory: shopCategory, animation: animation),
            ),
          ],
        ),
      );
}
