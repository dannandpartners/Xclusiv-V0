import 'package:flutter/material.dart';

class PersonalButtonWidget extends StatelessWidget {
  final bool isPersonal;
  final VoidCallback onClicked;

  const PersonalButtonWidget({
    @required this.isPersonal,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onClicked,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          width: isPersonal ? 35 : 100,
          height: 35,
          child: isPersonal ? buildShrinked() : buildStretched(),
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
              'Following',
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
          Icons.person,
          color: Colors.white,
        ),
      );
}
