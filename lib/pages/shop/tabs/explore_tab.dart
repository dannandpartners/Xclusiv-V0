import 'package:flutter/material.dart';
import 'package:xclusiv/pages/shop/tabs/components/discount_banner.dart';
import 'package:xclusiv/pages/shop/tabs/components/popular_product.dart';
import 'package:xclusiv/pages/shop/tabs/components/search_field.dart';
import 'package:xclusiv/size_config.dart';
import 'package:xclusiv/pages/shop/tabs/components/special_offers.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: (5 / 812.0) * MediaQuery.of(context).size.height),
        //SizedBox(height: getProportionateScreenHeight(5)),
        //SizedBox(height: 5),
        SearchField(),
        //SizedBox(height: getProportionateScreenWidth(10)),
        SizedBox(height: (30 / 812.0) * MediaQuery.of(context).size.height),
        DiscountBanner(),
        SpecialOffers(),
        //SizedBox(height: getProportionateScreenWidth(30)),
        SizedBox(height: (30 / 812.0) * MediaQuery.of(context).size.height),
        SpecialOffers(),
        //PopularProducts(),
        //SizedBox(height: getProportionateScreenWidth(30)),
        //SizedBox(height: 5),
      ],
    );
  }
}
