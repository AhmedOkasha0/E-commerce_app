import 'package:ecommerec_app/core/utils/app_color.dart';
import 'package:ecommerec_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
      

          backgroundColor: AppColor.primaryColor,
          
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: AppColor.grey,
          elevation: 0),
      fontFamily: AppStrings.fontFamily,
      appBarTheme: AppBarTheme(
        color: AppColor.primaryColor,
      ));
}
