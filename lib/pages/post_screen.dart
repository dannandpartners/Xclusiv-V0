import 'package:flutter/material.dart';
import 'package:xclusiv/widgets/header.dart';
import 'package:xclusiv/widgets/post.dart';
import 'package:xclusiv/widgets/progress.dart';

import 'home.dart';

class PostScreen extends StatelessWidget {
  final String postUserId;
  final String postId;

  PostScreen({this.postUserId, this.postId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            postsRef.doc(postUserId).collection('userPosts').doc(postId).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          Post post = Post.fromDocument(snapshot.data);
          return Center(
            child: Scaffold(
              appBar: header(context, titleText: post.description),
              body: ListView(
                children: [
                  Container(
                    child: post,
                  )
                ],
              ),
            ),
          );
        });
  }
}
