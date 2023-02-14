import '../../../../core/widgets/loading_widget.dart';
import '../bloc/posts/posts_bloc.dart';
import 'add_update_post_page.dart';
import '../widgets/posts_page/message_display_widget.dart';
import '../widgets/posts_page/post_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(context),
    );
  }

  AppBar _buildAppBar() => AppBar(title: const Text("Posts"));

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return const LoadingWidget();
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
              child: PostListWidget(posts: state.posts),
              onRefresh: () => _onRefresh(context),
            );
          } else if (state is ErrorPostsState) {
            return MessageDisplayWidget(message: state.errorMsg);
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  FloatingActionButton _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AddUpdatePostPage(
              isUpdatePost: false,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
  }
}
