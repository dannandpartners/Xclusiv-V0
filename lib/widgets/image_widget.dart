import 'package:flutter/material.dart';
import 'package:xclusiv/data/hero_tag.dart';
import 'package:xclusiv/models/shop_category.dart';
import 'package:xclusiv/widgets/hero_widget.dart';

class ImageWidget extends StatelessWidget {
  final ShopCategory shopCategory;

  const ImageWidget({
    @required this.shopCategory,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      /// space from white container
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: size.height * 0.5,
      width: size.width * 0.8,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            buildImage(),
            Positioned(
              top: 8,
              left: 20,
              right: 20,
              child: Center(child: buildTopText()),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage() => SizedBox.expand(
        child: HeroWidget(
          tag: HeroTag.image(shopCategory.urlImage),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.asset(shopCategory.urlImage, fit: BoxFit.cover),
          ),
        ),
      );

  Widget buildTopText() => Text(
        shopCategory.name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      );
}
