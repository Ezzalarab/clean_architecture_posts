// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_posts/core/util/snackbar_message.dart';
import 'package:clean_architecture_posts/core/widgets/loading_widget.dart';
import 'package:clean_architecture_posts/features/posts/presentation/bloc/add_update_delete_post/add_update_delete_post_bloc.dart';
import 'package:clean_architecture_posts/features/posts/presentation/pages/posts_page.dart';
import 'package:clean_architecture_posts/features/posts/presentation/widgets/add_update_post_page/form_widget.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_posts/features/posts/domain/entities/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUpdatePostPage extends StatelessWidget {
  final Post? post;
  final bool isUpdatePost;
  const AddUpdatePostPage({
    Key? key,
    this.post,
    required this.isUpdatePost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() =>
      AppBar(title: Text(isUpdatePost ? "Edit Post" : "Add Post"));

  Widget _buildBody() {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              BlocConsumer<AddUpdateDeletePostBloc, AddUpdateDeletePostState>(
            listener: (context, state) {
              if (state is SuccessAddUpdateDeleteState) {
                SnackBarMessage().showSuccessSnackBar(
                  context: context,
                  message: state.message,
                );
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const PostsPage()));
              }
            },
            builder: (context, state) {
              if (state is LoadingAddUpdateDeleteState) {
                return const LoadingWidget();
              } else if (state is ErrorAddUpdateDeleteState) {
                SnackBarMessage().showErrorSnackBar(
                  context: context,
                  message: state.errorMsg,
                );
              }
              return FormWidget(
                isUpdatePost: isUpdatePost,
                post: isUpdatePost ? post : null,
              );
            },
          )),
    );
  }
}
