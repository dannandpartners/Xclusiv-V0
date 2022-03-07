import 'package:flutter/material.dart';

import 'package:xclusiv/models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';
import 'package:xclusiv/size_config.dart';

class DetailsScreen extends StatelessWidget {
  //static String routeName = "/details";

  final Product product;

  const DetailsScreen({
    @required this.product,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      //appBar: CustomAppBar(rating: product.rating),
      //body: Body(product: product),
      body: IconButton(
        icon: Icon(Icons.close),
        onPressed: () => print(SizeConfig.screenWidth.toString()),
      ),
    );
  }
}
