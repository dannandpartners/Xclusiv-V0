import 'package:flutter/material.dart';

class BuyButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: 200,
        height: 40,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            'Reminder',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
}
