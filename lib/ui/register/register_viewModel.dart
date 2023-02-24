import 'package:ecommerec_app/API/api_manger.dart';
import 'package:ecommerec_app/ui/register/register_navigator.dart';
import 'package:flutter/cupertino.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterNavigator? navigator;
  void register(String name, String emailAdress, String password,
      String rePassword, String phonenumber) async {
    navigator?.showProgressDialog('Loading...');
    try {
      var response = await ApiManger.register(
          name, emailAdress, password, rePassword, phonenumber);
      navigator?.hideDialog();
      if (response.errors != null) {
        navigator?.showMessage(response.mergeErrors(), posActionTitle: 'ok');
        return;
      }
      navigator?.showMessage('successful Regstration', posActionTitle: 'ok',
          posAction: () {
        navigator?.navigateHome();
      });
    } catch (e) {
      navigator?.hideDialog();
      navigator?.showMessage('');
    }
  }
}
