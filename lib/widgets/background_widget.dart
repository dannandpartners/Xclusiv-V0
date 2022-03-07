import 'package:flutter/material.dart';
import 'package:xclusiv/data/xclusiv_data.dart';
import 'package:xclusiv/models/event.dart';

class BackgroundWidget extends StatelessWidget {
  final PageController controller;

  const BackgroundWidget({
    @required this.controller,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => PageView.builder(
        reverse: true,
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        itemBuilder: (context, index) {
          final event = events[index];

          return buildBackground(event: event);
        },
        itemCount: events.length,
      );

  Widget buildBackground({@required Event event}) => Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(event.eventPhotoUrl, fit: BoxFit.cover),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.15, 0.75],
                colors: [
                  Colors.white.withOpacity(0.0001),
                  Colors.white,
                ],
              ),
            ),
          )
        ],
      );
}
