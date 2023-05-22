
import 'package:flutter/animation.dart';

abstract class RegisterNavigator{
  void hideDialog();

  void showMessage(String message,
      {String? posActionTitle,
        VoidCallback? posAction,
        String? negActionTitle,
        VoidCallback? negAction,
        bool isDismissible = true});

  void showProgressDialog(String loadingMessage);
  void navigateHome();
}