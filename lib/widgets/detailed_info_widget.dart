import 'package:flutter/material.dart';
import 'package:xclusiv/data/hero_tag.dart';
import 'package:xclusiv/models/shop_category.dart';
import 'package:xclusiv/widgets/hero_widget.dart';

class DetailedInfoWidget extends StatelessWidget {
  final ShopCategory shopCategory;

  const DetailedInfoWidget({
    @required this.shopCategory,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroWidget(
              tag: HeroTag.description(shopCategory),
              child: Text(shopCategory.description),
            ),
            SizedBox(height: 8),
          ],
        ),
      );
}
