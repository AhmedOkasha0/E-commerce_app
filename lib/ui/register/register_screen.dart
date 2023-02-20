import 'package:ecommerec_app/themes/theme_screen.dart';
import 'package:ecommerec_app/widgets/custom_formfield.dart';
import 'package:ecommerec_app/widgets/form_label.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'registerScreen';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Image.asset('assets/images/route_logo.png')),
              FormLabel(label: 'Full Name'),
              CustomFormField('Enter Your Full Name'),
              FormLabel(label: 'Mobile Number'),
              CustomFormField(
                'Enter Your Mobile Number',
                keyboardType: TextInputType.number,
              ),
              FormLabel(label: 'E-mail Adress'),
              CustomFormField('Enter your E-mail Adress'),
              FormLabel(label: 'Password'),
              CustomFormField(
                'Enter your Password',
                hideText: true,
              ),
              FormLabel(label: 'ReEnter password'),
              CustomFormField(
                'Enter your password',
                hideText: true,
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Sign up'))
            ],
          ),
        ),
      ),
    );
  }
}
