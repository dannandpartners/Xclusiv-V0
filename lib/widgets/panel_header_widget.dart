import 'package:flutter/material.dart';
import 'package:xclusiv/models/demo_user.dart';
import 'package:xclusiv/widgets/public_button_widget.dart';
import 'package:xclusiv/widgets/personal_button_widget.dart';

class PanelHeaderWidget extends StatelessWidget {
  final User user;

  const PanelHeaderWidget({
    @required this.user,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(child: buildUser()),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //minimumSize: Size.fromHeight(40),
                elevation: 2,
                primary: Colors.white,
                // shape: StadiumBorder(),
              ),
              onPressed: () {},
              child: Text(
                'My Favorites',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ],
      );

  Widget buildUser() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          //SizedBox(height: 4),
          Text(user.location),
        ],
      );
}
