import 'package:ecommerec_app/config/themes/theme_screen.dart';
import 'package:ecommerec_app/core/utils/app_color.dart';
import 'package:ecommerec_app/ui/main/main_screen.dart';
import 'package:ecommerec_app/ui/login/login_model.dart';
import 'package:ecommerec_app/ui/login/login_view_model.dart';
import 'package:ecommerec_app/ui/register/register_screen.dart';
import 'package:ecommerec_app/ui/utils.dart';
import 'package:ecommerec_app/widgets/custom_formfield.dart';
import 'package:ecommerec_app/widgets/form_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailAdressController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  LoginViewModel viewModel = LoginViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        backgroundColor: AppColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: Image.asset('assets/images/route_logo.png')),
                  SizedBox(height: 70),
                  Text(
                    'Welcome Backe To Route ',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'please sign in with your mail',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 24),
                  FormLabel(label: 'E-mail Adress'),
                  CustomFormField(
                    'Enter your E-mail Adress',
                    controller: emailAdressController,
                    validator: (text) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text!);
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter  email';
                      }
                      if (!emailValid) {
                        return 'please enter valid email';
                      }
                      return null;
                    },
                  ),
                  FormLabel(label: 'Password'),
                  CustomFormField(
                    'Enter your Password',
                    controller: passwordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter e-mail password';
                      }
                      if (text.length < 6) {
                        return 'password must be more than 6 chars';
                      }
                      return null;
                    },
                    hideText: true,
                  ),
                  Text(
                    'forget password',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: login,
                    child: Text(
                      'Login',
                      style:
                          TextStyle(color: AppColor.primaryColor, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 23),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: AppColor.white),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RegisterScreen.routeName);
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RegisterScreen.routeName);
                      },
                      child: Text(
                        'Don`t have an account? Create Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.login(passwordController.text, emailAdressController.text);
  }

  @override
  void hideDialog() {
    DialogUtils.hideLoading(context);
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    DialogUtils.showMessage(context, message, () {
      Navigator.pop(context);
    }, 'ok');
  }

  @override
  void showProgressDialog(String loadingMessage) {
    DialogUtils.showLoading(context);
  }

  @override
  void navigateToHome() {
    Navigator.pushReplacementNamed(context, MainScreen.routeName);
  }
}
