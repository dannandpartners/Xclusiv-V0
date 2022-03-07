import 'package:flutter/material.dart';
import 'package:xclusiv/widgets/header.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => new _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  Axis scrollDirection = Axis.horizontal;
  bool isPostItemVisible = true;

  Widget buildContent() {
    return ListView.builder(
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
        child: Stack(
          children: [
            GestureDetector(
              //onTap: () => print('post tapped'),
              onTap: () =>
                  setState(() => isPostItemVisible = !isPostItemVisible),
              child: SizedBox(
                height: double.infinity,
                width: 320,
                child: Image.network(
                  //'https://source.unsplash.com/random?sig=$index',
                  'https://source.unsplash.com/collection/474002?sig=$index',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Center(
                child: Visibility(
                  visible: isPostItemVisible,
                  child: Column(
                    children: [
                      Card(
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        //shadowColor: Colors.black,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Harry weds Amilia',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '#AMY2022',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Divider(
                                thickness: 1.2,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 2,
                              ),

                              /* Text(
                                'Sat, 1 January 2022',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '5:30 pm',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ), */
                              Text(
                                'The Afficent, Nassarawa, Kano, 700282, Nigeria',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  backgroundImage: NetworkImage(
                                    "https://source.unsplash.com/collection/2393655",
                                  ),
                                ),
                                Text(
                                  'naajieb',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                size: 28.0,
                                color: Colors.white,
                              ),
                              onPressed: () => print('open camera'),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.comment_outlined,
                                size: 28.0,
                                color: Colors.white,
                              ),
                              onPressed: () => print('open camera'),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_bag_outlined,
                                size: 28.0,
                                color: Colors.white,
                              ),
                              onPressed: () => print('open camera'),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.add_to_photos_outlined,
                                size: 28.0,
                                color: Colors.white,
                              ),
                              onPressed: () => print('open camera'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /*
            Visibility(
              visible: isPostItemVisible,
              child: Positioned(
                  top: 26,
                  right: 10,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.add_a_photo_outlined,
                          size: 24.0,
                          color: Colors.white,
                        ),
                        onPressed: () => print('open camera'),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.chat_bubble_outline_rounded,
                          size: 24.0,
                          color: Colors.white,
                        ),
                        onPressed: () => print('open chat'),
                      ),
                    ],
                  )),
            )*/
          ],
        ),
      ),
      itemCount: 20,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        //extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Xclusiv',
            style: TextStyle(
              fontFamily: 'Signatra',
              color: Colors.white,
              fontSize: 50.0,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 1,
                  //offset: Offset(2, 1),
                ),
              ],
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Container(color: Colors.white, child: buildContent()),
      );
}
