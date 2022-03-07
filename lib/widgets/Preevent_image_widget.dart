import 'package:flutter/material.dart';

class PreEventImageWidget extends StatelessWidget {
  final int index;

  const PreEventImageWidget({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 150,
        width: double.infinity,
        child: Card(
          child: Image.network(
            'https://source.unsplash.com/user/wedding_dreamz?sig=$index',
            //'https://source.unsplash.com/collection/9002497?sig=$index',

            fit: BoxFit.cover,
          ),
        ),
      );
}
