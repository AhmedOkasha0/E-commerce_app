import 'package:ecommerec_app/themes/theme_screen.dart';
import 'package:ecommerec_app/ui/login/login.dart';
import 'package:ecommerec_app/ui/register/register_screen.dart';
import 'package:ecommerec_app/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        Splash_screen.routeName: (context) => Splash_screen(),
      },
      initialRoute: Splash_screen.routeName,
      theme: ThemeScreen.lightTheme,
      // theme
      //th
    );
  }
}
