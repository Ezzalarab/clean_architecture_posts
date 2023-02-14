// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_posts/features/posts/presentation/bloc/add_update_delete_post/add_update_delete_post_bloc.dart';
import 'package:clean_architecture_posts/features/posts/presentation/widgets/add_update_post_page/form_submit_btn.dart';
import 'package:clean_architecture_posts/features/posts/presentation/widgets/add_update_post_page/text_form_field_widget.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_posts/features/posts/domain/entities/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    Key? key,
    required this.isUpdatePost,
    this.post,
  }) : super(key: key);
  final bool isUpdatePost;
  final Post? post;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdatePost) {
      _titleController.text = widget.post!.title;
      _bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  Future validThenAddOrUpdatePost() async {
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      final newPost = Post(
        id: widget.isUpdatePost ? widget.post!.id : null,
        title: _titleController.text,
        body: _bodyController.text,
      );
      if (widget.isUpdatePost) {
        BlocProvider.of<AddUpdateDeletePostBloc>(context)
            .add(UpdatePostEvent(post: newPost));
      } else {
        BlocProvider.of<AddUpdateDeletePostBloc>(context)
            .add(AddPostEvent(post: newPost));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormFieldWidget(
            name: "Title",
            multiline: false,
            controller: _titleController,
          ),
          TextFormFieldWidget(
            name: "Body",
            multiline: true,
            controller: _bodyController,
          ),
          FormSubmitBtn(
            isUpdatePost: widget.isUpdatePost,
            onPressed: validThenAddOrUpdatePost,
            icon: Icon(widget.isUpdatePost ? Icons.edit : Icons.add),
            label: widget.isUpdatePost ? "Update" : "Add",
          ),
        ],
      ),
    );
  }
}
