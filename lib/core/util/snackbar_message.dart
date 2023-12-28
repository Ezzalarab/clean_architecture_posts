import 'package:flutter/material.dart';

class SnackBarMessage {
  void showSnackBar({
    required BuildContext context,
    required String message,
    Color bgColor = Colors.black38,
    Color msgColor = Colors.white,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: bgColor,
        content: Text(
          message,
          style: TextStyle(
            color: msgColor,
          ),
        ),
      ),
    );
  }

  void showSuccessSnackBar({
    required BuildContext context,
    required String message,
  }) {
    showSnackBar(
      context: context,
      message: message,
      bgColor: Colors.green,
    );
  }

  void showErrorSnackBar({
    required BuildContext context,
    required String message,
  }) {
    showSnackBar(
      context: context,
      message: message,
      bgColor: Colors.red,
    );
  }
}
