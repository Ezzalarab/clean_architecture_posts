import '../../../domain/entities/post.dart';
import '../../pages/add_update_post_page.dart';
import 'package:flutter/material.dart';

class UpdatePostBtn extends StatelessWidget {
  const UpdatePostBtn({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddUpdatePostPage(
              isUpdatePost: true,
              post: post,
            ),
          ),
        );
      },
      icon: const Icon(Icons.edit),
      label: const Text("Edit"),
    );
  }
}
