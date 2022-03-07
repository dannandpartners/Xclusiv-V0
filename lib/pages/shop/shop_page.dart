import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xclusiv/pages/shop/tabs/explore_tab.dart';
import 'package:xclusiv/pages/shop/tabs/category_tab.dart';
import 'package:xclusiv/pages/shop/tabs/profile_tab.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: PageView(
          children: [
            HomeTab(),
            CategoryTab(),
            SearchTab(),
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        //ShopCategoriesWidget(),
        bottomNavigationBar: buildBottomNavigation(),
      );

  Widget buildAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Shopping',
          style: TextStyle(color: Colors.blueGrey),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Colors.blueGrey,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.favorite_rounded,
            color: Colors.blueGrey,
          ),
          onPressed: () {},
        ),
      );

  Widget buildBottomNavigation() => BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.blueGrey,
        iconSize: 30,
        backgroundColor: Colors.transparent,
        elevation: 0,
        onTap: onTap,
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: ''),
        ],
      );

  onPageChanged(int index) {
    setState(() {
      this.pageIndex = index;
    });
  }

  void onTap(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
