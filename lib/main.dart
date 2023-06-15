import 'package:ecommerec_app/config/themes/theme_screen.dart';
import 'package:ecommerec_app/ui/login/login_view.dart';
import 'package:ecommerec_app/ui/main/main_screen.dart';
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
        Splashscreen.routeName: (context) => Splashscreen(),
        MainScreen.routeName: (context) => MainScreen(),
      },
      initialRoute: MainScreen.routeName,
      theme: appTheme(),
      // theme
      //th
    );
  }
}
