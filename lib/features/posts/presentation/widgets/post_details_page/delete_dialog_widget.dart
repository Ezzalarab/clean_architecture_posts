// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:clean_architecture_posts/features/posts/presentation/bloc/add_update_delete_post/add_update_delete_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteDialogWidget extends StatelessWidget {
  final int postId;
  const DeleteDialogWidget({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Are you sure?"),
      actions: [
        TextButton(
          child: const Text(
            "No",
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text(
            "Delete",
          ),
          onPressed: () {
            BlocProvider.of<AddUpdateDeletePostBloc>(context).add(
              DeletePostEvent(postId: postId),
            );
          },
        ),
      ],
    );
  }
}
