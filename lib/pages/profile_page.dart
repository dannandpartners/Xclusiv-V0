import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:xclusiv/widgets/panel_widget.dart';
import 'package:xclusiv/data/users_data.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final panelController = PanelController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final user = users[index];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {},
          ),
        ],
      ),
      body: SlidingUpPanel(
        maxHeight: 500,
        minHeight: 150,
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        controller: panelController,
        color: Colors.transparent,
        body: Image.asset(user.urlImage, fit: BoxFit.cover),
        panelBuilder: (ScrollController scrollController) => PanelWidget(
          user: user,
          onClickedPanel: panelController.open,
        ),
      ),
    );
  }
}
