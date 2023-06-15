import 'package:ecommerec_app/config/text/text_style.dart';
import 'package:ecommerec_app/core/utils/app_color.dart';
import 'package:ecommerec_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      style: TextStyles.textStyle10,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.ltr,
        hintText: AppStrings.search,
        filled: false,
        focusColor: AppColor.white,
        fillColor: AppColor.primaryColor,
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8, top: 8.0, right: 8),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(24),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24)),
        ),
      ),
    );
  }
}
