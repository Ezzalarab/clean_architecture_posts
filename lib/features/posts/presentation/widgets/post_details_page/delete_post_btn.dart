// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture_posts/core/util/snackbar_message.dart';
import 'package:clean_architecture_posts/core/widgets/loading_widget.dart';
import 'package:clean_architecture_posts/features/posts/presentation/bloc/add_update_delete_post/add_update_delete_post_bloc.dart';
import 'package:clean_architecture_posts/features/posts/presentation/pages/posts_page.dart';
import 'package:clean_architecture_posts/features/posts/presentation/widgets/post_details_page/delete_dialog_widget.dart';

class DeletePostBtn extends StatelessWidget {
  final int postId;
  const DeletePostBtn({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        deleteDialog(context, postId);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.redAccent),
      ),
      icon: const Icon(Icons.delete_outline),
      label: const Text("Delete"),
    );
  }

  void deleteDialog(BuildContext context, int postId) {
    showDialog(
      context: context,
      builder: (context) =>
          BlocConsumer<AddUpdateDeletePostBloc, AddUpdateDeletePostState>(
        builder: (context, state) {
          if (state is LoadingAddUpdateDeleteState) {
            return const AlertDialog(
              title: LoadingWidget(),
            );
          }
          return DeleteDialogWidget(postId: postId);
        },
        listener: (context, state) {
          if (state is SuccessAddUpdateDeleteState) {
            SnackBarMessage().showSuccessSnackBar(
              context: context,
              message: state.message,
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const PostsPage(),
              ),
              (route) => false,
            );
          } else if (state is ErrorAddUpdateDeleteState) {
            Navigator.of(context).pop();
            SnackBarMessage().showErrorSnackBar(
              context: context,
              message: state.errorMsg,
            );
          }
        },
      ),
    );
  }
}
