import 'package:flutter/material.dart';
import 'package:xclusiv/models/demo_user.dart';
import 'package:xclusiv/widgets/panel_header_widget.dart';
import 'package:xclusiv/widgets/stats_widget.dart';

class PanelWidget extends StatelessWidget {
  final User user;
  final VoidCallback onClickedPanel;

  const PanelWidget({
    @required this.user,
    @required this.onClickedPanel,
    Key key,
  }) : super(key: key);

  final double tabBarHeight = 80;

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          children: [
            StatsWidget(user: user),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: buildProfile(),
            ),
            Expanded(
              child: DefaultTabController(
                initialIndex: 1,
                length: 2,
                child: Stack(
                  children: [
                    Scaffold(
                      appBar: PreferredSize(
                        //preferredSize: Size.fromHeight(tabBarHeight - 28),
                        preferredSize: Size.fromHeight(50),
                        child: AppBar(
                          excludeHeaderSemantics: true,
                          elevation: 0,
                          backgroundColor: Colors.white,
                          shadowColor: Colors.white,

                          //centerTitle: false,
                          //title: Text(
                          //'Media',
                          //style: TextStyle(color: Colors.black),
                          // ),
                          bottom: TabBar(
                            labelColor: Colors.deepOrange,
                            unselectedLabelColor: Colors.blueGrey,
                            indicatorColor: Colors.transparent,
                            //unselectedLabelColor: Colors.redAccent,
                            //indicatorSize: TabBarIndicatorSize.tab,
                            //indicator: BoxDecoration(
                            // borderRadius: BorderRadius.circular(50),
                            // color: Colors.blueGrey),
                            tabs: <Widget>[
                              Tab(
                                icon: Icon(
                                  Icons.person,
                                  //color: Colors.blueGrey,
                                ),
                                //iconMargin: EdgeInsets.only(left: 20.0),
                              ),
                              Tab(
                                  icon: Icon(
                                Icons.people,
                                //color: Colors.blueGrey,
                              )),
                            ],
                          ),
                        ),
                      ),
                      body: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          GridView(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 1,
                              childAspectRatio: 2 / 1,
                            ),
                            scrollDirection: Axis.horizontal,
                            children: user.urlPhotos
                                .map(
                                  (url) => Container(
                                    height: 200,
                                    width: 100,
                                    padding: EdgeInsets.only(
                                        right: 5, top: 5, bottom: 5),
                                    child: Image.asset(url, fit: BoxFit.cover),
                                  ),
                                )
                                .toList(),
                          ),
                          //(
                          //child: Text("It's rainy here"),
                          //),
                          GridView(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 1,
                              childAspectRatio: 2 / 1,
                            ),
                            scrollDirection: Axis.horizontal,
                            children: user.urlPhotos
                                .map(
                                  (url) => Container(
                                    height: 200,
                                    width: 100,
                                    padding: EdgeInsets.only(
                                        right: 5, top: 5, bottom: 5),
                                    child: Image.asset(url, fit: BoxFit.cover),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.only(top: 8, left: 25, right: 25),
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                        height: 70.0,
                        color: Colors.white,
                        child: Text(
                          user.bio,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildProfile() => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onClickedPanel,
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              PanelHeaderWidget(
                user: user,
              ),
              SizedBox(height: 0),
              buildProfileDetails(user),
            ],
          ),
        ),
      );

  Widget buildProfileDetails(User user) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SizedBox(height: 12),
          //SizedBox(height: 12),
        ],
      );
}
