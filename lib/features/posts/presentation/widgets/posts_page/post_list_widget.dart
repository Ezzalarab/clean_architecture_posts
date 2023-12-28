// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_posts/features/posts/presentation/pages/post_details_page.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_posts/features/posts/domain/entities/post.dart';

class PostListWidget extends StatelessWidget {
  const PostListWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) => ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        leading: Text(
          posts[index].id.toString(),
        ),
        title: Text(
          posts[index].title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          posts[index].body,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => PostDetailsPage(post: posts[index])));
        },
      ),
      separatorBuilder: (context, index) => const Divider(thickness: 1),
    );
  }
}
