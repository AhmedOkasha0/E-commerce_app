import 'package:ecommerec_app/config/text/text_style.dart';
import 'package:ecommerec_app/core/utils/app_color.dart';
import 'package:ecommerec_app/core/utils/app_strings.dart';
import 'package:ecommerec_app/core/utils/constants.dart';
import 'package:ecommerec_app/core/utils/media_query.dart';
import 'package:ecommerec_app/ui/home/widget/text_form.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(17),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(ImagePath.miniLogo),
          SizedBox(
            height: context.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: context.width * 0.78, child: CustomTextForm()),
              IconButton(onPressed: () {}, icon: (Image.asset(ImagePath.cart))),
            ],
          )
        ],
      )),
    );
  }
}
