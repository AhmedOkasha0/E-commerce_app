import 'package:ecommerec_app/API/api_manger.dart';
import 'package:ecommerec_app/themes/theme_screen.dart';
import 'package:ecommerec_app/ui/utils.dart';
import 'package:ecommerec_app/widgets/custom_formfield.dart';
import 'package:ecommerec_app/widgets/form_label.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailAdressController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: ThemeScreen.primeColor,
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
                    color: ThemeScreen.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'please sign in with your mail',
                  style: TextStyle(
                    color: ThemeScreen.white,
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
                    color: ThemeScreen.white,
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
                        TextStyle(color: ThemeScreen.primeColor, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 23),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: ThemeScreen.white),
                ),
                SizedBox(height: 24,),
                Text(
                  'Don`t have an account? Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeScreen.white,
                    fontSize: 18,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == false) {}
    DialogUtils.showLoading(context);
    try {
      var response = await ApiManger.login(
        emailAdressController.text,
        passwordController.text,
      );
      DialogUtils.hideLoading(context);
      if (response.message != null) {
        DialogUtils.showMessage(context, response.message ?? '', () {
          Navigator.pop(context);
        }, 'ok');
        return;
      }
      DialogUtils.showMessage(context, response.token ?? '', () {
        Navigator.pop(context);
      }, 'ok');
    } catch (e) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context, 'error' + e.toString(), () {
        Navigator.pop(context);
      }, 'ok');
    }
  }
}
