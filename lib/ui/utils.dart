import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                Text('loading'),
              ],
            ),
          );
        });
  }

  static void hideLoading(
    BuildContext context,
  ) {
    Navigator.of(context).pop();
  }

  static void showMessage(
      context, String message, Function posAction, String posActionText) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
            actions: [TextButton(onPressed: () {}, child: Text(posActionText))],
          );
        });
  }
}
