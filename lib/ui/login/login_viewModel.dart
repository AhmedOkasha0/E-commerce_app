import 'package:ecommerec_app/API/api_manger.dart';
import 'package:ecommerec_app/ui/login/login_navigator.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  LoginNavigator? navigator;
  void login(String email, String password) async {
    navigator?.showProgressDialog('Loading ...');
    try {
      var response = await ApiManger.login(email, password);
      navigator?.hideDialog();
      if (response.message != null) {
        navigator?.showMessage(response.message ?? '', posActionTitle: 'ok');
        return;
      }
      navigator?.showMessage( 'successful Registration', posActionTitle: 'ok',posAction: (){
        navigator?.navigateToHome();
      });
    } catch (e) {
      navigator?.hideDialog();
      navigator?.showMessage('error' + e.toString());
    }
  }
}
