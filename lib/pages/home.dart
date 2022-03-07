//import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:xclusiv/pages/event_list.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:xclusiv/pages/create_account.dart';
import 'package:xclusiv/pages/create_event.dart';
import 'package:xclusiv/pages/profile.dart';
import 'package:xclusiv/pages/my_collection.dart';
import 'package:xclusiv/pages/search.dart';
import 'package:xclusiv/pages/activity_feed.dart';
import 'package:xclusiv/pages/upload.dart';
import 'package:xclusiv/pages/timeline.dart';
import 'package:xclusiv/pages/shop/shop_page.dart';
import 'package:xclusiv/models/user.dart';
import 'package:xclusiv/pages/profile_page.dart';
import 'package:xclusiv/pages/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:xclusiv/pages/shop/screens/details/details_screen.dart';
import 'event_page.dart';
import 'timeline_page.dart';

final usersRef = FirebaseFirestore.instance.collection('users');
final postsRef = FirebaseFirestore.instance.collection('posts');
final commentsRef = FirebaseFirestore.instance.collection('comments');
final activityFeedRef = FirebaseFirestore.instance.collection('feed');
final followersRef = FirebaseFirestore.instance.collection('followers');
final followingRef = FirebaseFirestore.instance.collection('following');
final timelineRef = FirebaseFirestore.instance.collection('timeline');
final eventRef = FirebaseFirestore.instance.collection('events');
final firebase_storage.Reference storageRef =
    firebase_storage.FirebaseStorage.instance.ref();

final GoogleSignIn googleSignIn = GoogleSignIn();
final DateTime timestamp = DateTime.now();
User currentUser;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isAuth = false;

  //final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1);
    //Detects when user signed in!
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account);
    }, onError: (err) {
      print('error signing in : $err');
    });
    //Re-authenticate user when app is opened!
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account);
    }).catchError((err) {
      print('error signing in : $err');
    });
  }

  handleSignIn(GoogleSignInAccount account) async {
    if (account != null) {
      //print('User signed in $account');
      await createUserInFirestore();
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  createUserInFirestore() async {
    //1) check if user exist in user collection in database (according to their ID)
    final GoogleSignInAccount user = googleSignIn.currentUser;
    DocumentSnapshot doc = await usersRef.doc(user.id).get();

    if (!doc.exists) {
      //2) If the user doesn't exist, then we want to take them to create account page
      //print('EEEE: $doc');
      final username = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateAccount()),
      );
      //print('EEEE: $username');
      //3) get user name from create account, use it to make new user document in users collection
      usersRef.doc(user.id).set({
        'id': user.id,
        'username': username,
        'photoUrl': user.photoUrl,
        'email': user.email,
        'displayName': user.displayName,
        'bio': '',
        'timestamp': timestamp
      });
      // Make new user their oen followers (to include their posts in their timeline)
      await followersRef
          .doc(user.id)
          .collection('userFollowers')
          .doc(user.id)
          .set({});

      doc = await usersRef.doc(user.id).get();
    }

    currentUser = User.fromDocument(doc);
    //print(currentUser);
    //print(currentUser.username);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  Scaffold buildAuthScreen() {
    //return RaisedButton(child: Text('Logout'), onPressed: logout);
    return Scaffold(
      //extendBody: true,
      key: _scaffoldKey,
      body: PageView(
        children: <Widget>[
          //ElevatedButton(
          //onPressed: logout,
          //child: Text('Logout'),
          //),
          Upload(currentUser: currentUser),
          ListViewPage(),
          //Timeline(currentUser: currentUser),
          //ActivityFeed(),
          //CreateEvent(currentUser: currentUser),
          EventList(),
          //EventPage(),
          Search(),
          ShopPage(),
          ProfilePage(),
          //MyCollection(),
          //Profile(profileId: currentUser?.id),
          // Profile(profileId: currentUser?.id),
          //DetailsScreen()
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        scrollDirection: Axis.vertical,
        //physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              // Theme.of(context).accentColor,
              // Theme.of(context).primaryColor,
              Colors.deepPurple,
              Colors.black,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Xclusiv',
              style: TextStyle(
                  fontFamily: "Signatra", fontSize: 90.0, color: Colors.white),
            ),
            GestureDetector(
              onTap: login,
              child: Container(
                width: 260.0,
                height: 35.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/google_signin_button.png'),
                      fit: BoxFit.cover),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
