import 'package:ecommerec_app/API/api_manger.dart';
import 'package:ecommerec_app/themes/theme_screen.dart';
import 'package:ecommerec_app/ui/utils.dart';
import 'package:ecommerec_app/widgets/custom_formfield.dart';
import 'package:ecommerec_app/widgets/form_label.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'registerScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailAdressController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: ThemeScreen.primeColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Image.asset('assets/images/route_logo.png')),
                FormLabel(label: 'Full Name'),
                CustomFormField(
                  'Enter Your Full Name',
                  controller: nameController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter name ';
                    }
                  },
                ),
                FormLabel(label: 'Mobile Number'),
                CustomFormField(
                  'Enter Your Mobile Number',
                  controller: phoneController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter mobil number';
                    }
                  },
                  keyboardType: TextInputType.number,
                ),
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
                FormLabel(label: 'ReEnter password'),
                CustomFormField(
                  'Enter your password',
                  controller: repasswordController,
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
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: register,
                  child: Text('sign up',style: TextStyle(
                    color: ThemeScreen.primeColor,
                    fontSize: 20
                  ),),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 23),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: ThemeScreen.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formKey.currentState?.validate() == false) {
      return DialogUtils.showLoading(context);
    }
    DialogUtils.showLoading(context);
    try {
      var response = await ApiManger.register(
          nameController.text,
          emailAdressController.text,
          passwordController.text,
          repasswordController.text,
          phoneController.text);
      DialogUtils.hideLoading(context);
      if (response.errors != null) {
        DialogUtils.showMessage(context, response.mergeErrors(), () {
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
