import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xclusiv/models/user_settings.dart';

class User {
  final String id;
  final String username;
  final String email;
  final String photoUrl;
  final String displayName;
  final String bio;
  //final UserSettings userSettings;

  User({
    this.id,
    this.username,
    this.email,
    this.photoUrl,
    this.displayName,
    this.bio,
    //this.userSettings = const UserSettings(),
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      id: doc['id'],
      username: doc['username'],
      email: doc['email'],
      photoUrl: doc['photoUrl'],
      displayName: doc['displayName'],
      bio: doc['bio'],
      //userSettings: doc['userSettings'],
    );
  }
}
