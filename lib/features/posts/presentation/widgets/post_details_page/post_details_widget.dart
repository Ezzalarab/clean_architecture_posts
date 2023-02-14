// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_posts/core/util/snackbar_message.dart';
import 'package:clean_architecture_posts/core/widgets/loading_widget.dart';
import 'package:clean_architecture_posts/features/posts/presentation/bloc/add_update_delete_post/add_update_delete_post_bloc.dart';
import 'package:clean_architecture_posts/features/posts/presentation/pages/add_update_post_page.dart';
import 'package:clean_architecture_posts/features/posts/presentation/pages/posts_page.dart';
import 'package:clean_architecture_posts/features/posts/presentation/widgets/post_details_page/delete_dialog_widget.dart';
import 'package:clean_architecture_posts/features/posts/presentation/widgets/post_details_page/delete_post_btn.dart';
import 'package:clean_architecture_posts/features/posts/presentation/widgets/post_details_page/update_post_btn.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_posts/features/posts/domain/entities/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailsWidget extends StatelessWidget {
  final Post post;
  const PostDetailsWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            post.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(height: 50),
          Text(
            post.body,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Divider(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdatePostBtn(post: post),
              DeletePostBtn(postId: post.id!),
            ],
          ),
        ],
      ),
    );
  }
}
