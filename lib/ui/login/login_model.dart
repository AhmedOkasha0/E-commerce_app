import 'package:flutter/material.dart';

abstract class LoginNavigator {
  void hideDialog();

  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDismissible = true});

  void showProgressDialog(String loadingMessage);
  void navigateToHome();
}