import 'package:flutter/material.dart';
import 'package:xclusiv/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';

//void main() {
//  runApp(MyApp());
//}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(xclusiv());
}

class xclusiv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xclusiv',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey, accentColor: Colors.deepPurple),
      home: Home(),
    );
  }
}
