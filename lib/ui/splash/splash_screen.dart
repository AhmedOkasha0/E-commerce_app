import 'dart:async';

import 'package:ecommerec_app/ui/register/register_screen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/splash_screen.png',
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
