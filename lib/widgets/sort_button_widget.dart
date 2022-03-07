import 'package:flutter/material.dart';

class SortButtonWidget extends StatelessWidget {
  final bool isPriceSorting;
  final VoidCallback onClicked;
  final String sortType;

  const SortButtonWidget({
    @required this.isPriceSorting,
    @required this.onClicked,
    @required this.sortType,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onClicked,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          width: isPriceSorting ? 35 : 100,
          height: 35,
          child: isPriceSorting ? buildShrinked() : buildStretched(),
        ),
      );

  Widget buildStretched() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.deepOrangeAccent, width: 2.5),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              sortType,
              style: TextStyle(
                color: Colors.deepOrangeAccent,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );

  Widget buildShrinked() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.deepOrangeAccent),
        child: Icon(
          Icons.people,
          color: Colors.white,
        ),
      );
}
