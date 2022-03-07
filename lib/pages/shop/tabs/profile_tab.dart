import 'package:flutter/material.dart';
import 'package:xclusiv/pages/shop/components/profile_menu.dart';
import 'package:xclusiv/pages/shop/components/profile_pic.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: 16),
        ProfileMenu(
          text: "My Orders",
          icon: "assets/icons/Parcel.svg",
          press: () {},
        ),
        ProfileMenu(
          text: "My Account",
          icon: "assets/icons/User Icon.svg",
          press: () => {},
        ),
        ProfileMenu(
          text: "My Tags",
          icon: "assets/icons/User Icon.svg",
          press: () => {},
        ),
        ProfileMenu(
          text: "Settings",
          icon: "assets/icons/Settings.svg",
          press: () {},
        ),
        ProfileMenu(
          text: "Help Center",
          icon: "assets/icons/Question mark.svg",
          press: () {},
        ),
      ],
    );
  }
}
