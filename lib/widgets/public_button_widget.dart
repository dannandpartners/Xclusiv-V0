import 'package:flutter/material.dart';

class PublicButtonWidget extends StatelessWidget {
  final bool isPublic;
  final VoidCallback onClicked;

  const PublicButtonWidget({
    @required this.isPublic,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onClicked,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          width: isPublic ? 35 : 100,
          height: 35,
          child: isPublic ? buildShrinked() : buildStretched(),
        ),
      );

  Widget buildStretched() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.deepOrange, width: 2.5),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              'BOUGHT',
              style: TextStyle(
                color: Colors.deepOrange,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );

  Widget buildShrinked() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.deepOrange),
        child: Icon(
          Icons.people,
          color: Colors.white,
        ),
      );
}
