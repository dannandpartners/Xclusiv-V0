import 'package:flutter/material.dart';
import 'package:xclusiv/pages/post_screen.dart';
import 'package:xclusiv/widgets/custom_image.dart';
import 'package:xclusiv/widgets/post.dart';

class PostTile extends StatelessWidget {
  final Post post;

  PostTile(this.post);

  showPost(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostScreen(
          postId: post.postId,
          postUserId: post.ownerId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPost(context),
      child: cachedNetworkImage(post.mediaUrl),
    );
  }
}
