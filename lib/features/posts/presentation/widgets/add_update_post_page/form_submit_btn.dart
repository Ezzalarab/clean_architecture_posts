// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FormSubmitBtn extends StatelessWidget {
  final String label;
  final Icon icon;
  final void Function() onPressed;
  final bool isUpdatePost;
  const FormSubmitBtn({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.isUpdatePost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label),
    );
  }
}
