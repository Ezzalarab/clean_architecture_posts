// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_posts/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_posts/features/posts/presentation/widgets/post_details_page/post_details_widget.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;
  const PostDetailsPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() => Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: PostDetailsWidget(
            post: post,
          ),
        ),
      );

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Post Details"),
    );
  }
}
