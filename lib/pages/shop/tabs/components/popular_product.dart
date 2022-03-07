import 'package:flutter/material.dart';
import 'package:xclusiv/pages/shop/components/product_card.dart';
import 'package:xclusiv/models/Product.dart';
import 'package:xclusiv/size_config.dart';
import 'package:xclusiv/pages/shop/tabs/components/section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: (5 / 375.0) * MediaQuery.of(context).size.width),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: (5 / 812.0) * MediaQuery.of(context).size.height),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular)
                    return ProductCard(product: demoProducts[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: (5 / 375.0) * MediaQuery.of(context).size.width),
            ],
          ),
        )
      ],
    );
  }
}
