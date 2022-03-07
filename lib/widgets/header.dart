import 'package:flutter/material.dart';

AppBar header(context,
    {bool isAppTitle = false, String titleText, removeBackButton = false}) {
  return AppBar(
    automaticallyImplyLeading: removeBackButton ? false : true,
    title: Text(
      isAppTitle ? 'Xclusiv' : titleText,
      style: TextStyle(
        fontFamily: isAppTitle ? 'Signatra' : '',
        color: Colors.white,
        fontSize: isAppTitle ? 50.0 : 22.0,
        shadows: [
          Shadow(
            color: Colors.black,
            blurRadius: 2,
            //offset: Offset(2, 1),
          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
    ),
    actions: [
      Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.add_box_outlined,
              size: 24.0,
              color: Colors.white,
            ),
            onPressed: () => print('open camera'),
          ),
          IconButton(
            icon: Icon(
              Icons.message_outlined,
              size: 24.0,
              color: Colors.white,
            ),
            onPressed: () => print('open chat'),
          ),
        ],
      ),
    ],
    //centerTitle: true,
    //backgroundColor: Theme.of(context).primaryColorDark,
    //backgroundColor: Colors.transparent,
    backgroundColor: Colors.black12,
    elevation: 1,
  );
}
