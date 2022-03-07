//import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:xclusiv/models/user.dart';
import 'package:xclusiv/pages/home.dart';
import 'package:xclusiv/widgets/progress.dart';
import 'package:xclusiv/widgets/switch_widget.dart';

class EditProfile extends StatefulWidget {
  final String currentUserId;

  EditProfile({this.currentUserId});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController displayNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  bool isLoading = false;
  User user;
  bool _displayNameValid = true;
  bool _bioValid = true;
  bool isEdit = true;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    setState(() {
      isLoading = true;
    });
    DocumentSnapshot doc = await usersRef.doc(widget.currentUserId).get();
    user = User.fromDocument(doc);
    displayNameController.text = user.displayName;
    bioController.text = user.bio;
    setState(() {
      isLoading = false;
    });
  }

  Column buildDisplayNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text(
            'Display Name',
            style: TextStyle(color: Colors.white70),
          ),
        ),
        TextField(
          controller: displayNameController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Update Display Name',
            hintStyle: TextStyle(color: Colors.white70),
            errorText: _displayNameValid ? null : 'Display Name too Short',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
      ],
    );
  }

  Column buildBioField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text(
            'Bio',
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextField(
          controller: bioController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            hintText: 'Update Bio',
            errorText: _bioValid ? null : 'Bio too Long',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
      ],
    );
  }

  updateProfileData() {
    setState(() {
      displayNameController.text.trim().length < 3 ||
              displayNameController.text.isEmpty
          ? _displayNameValid = false
          : _displayNameValid = true;

      bioController.text.trim().length > 100
          ? _bioValid = false
          : _bioValid = true;
    });
    if (_displayNameValid && _bioValid) {
      usersRef.doc(widget.currentUserId).update({
        'displayName': displayNameController.text,
        'bio': bioController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Profile updated!'),
      ));
    }
  }

  logout() async {
    await googleSignIn.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 15,
          ),
        ),
      );

  Widget buildCircle({
    Widget child,
    double all,
    Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );

  Widget buildAllowPostNotifications() => SwitchWidget(
        title: 'Allow Post Notifications',
        //value: user.settings.allowNotifications,
        onChanged: (allowPostNotifications) {
          //final settings = user.settings.copy(
          //allowPostNotifications: allowPostNotifications,
          //);

          //setState(() => user = user.copy(settings: settings));
        },
      );

  Widget buildAllowInviteNotification() => SwitchWidget(
        title: 'Allow Invite Notification',
        // value: user.settings.allowNewsletter,
        onChanged: (allowInviteNotification) {
          //final settings = user.settings.copy(
          //allowInviteNotification: allowInviteNotification,
          //);

          // setState(() => user = user.copy(settings: settings));
        },
      );

  Widget buildAllowShopNotification() => SwitchWidget(
        title: 'Allow Invite Notification',
        // value: user.settings.allowNewsletter,
        onChanged: (allowShopNotification) {
          //final settings = user.settings.copy(
          //allowShopNotification: allowShopNotification,
          //);

          // setState(() => user = user.copy(settings: settings));
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.done,
              size: 30.0,
              color: Colors.green,
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: isLoading
          ? circularProgress()
          : ListView(
              children: [
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 16.0,
                          bottom: 8.0,
                        ),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.grey,
                              backgroundImage:
                                  CachedNetworkImageProvider(user.photoUrl),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 4,
                              child: GestureDetector(
                                child: buildEditIcon(Colors.deepPurple),
                                onTap: () =>
                                    print('upload photo from  gallary'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            buildDisplayNameField(),
                            buildBioField(),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      //buildAllowInviteNotification(),
                      //buildAllowPostNotifications(),
                      //buildAllowShopNotification(),
                      SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: updateProfileData,
                        child: Text(
                          'Update Profile',
                          style: TextStyle(
                            //color: Theme.of(context).primaryColor,
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TextButton.icon(
                          onPressed: logout,
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                          label: Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
