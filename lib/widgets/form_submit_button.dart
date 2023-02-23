import 'package:ecommerec_app/themes/theme_screen.dart';
import 'package:flutter/material.dart';

class FormSubmitBotton extends StatelessWidget {
  FormSubmitBotton(this.text,this.onPress);
  String text;
  VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 23),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: ThemeScreen.white),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).primaryColor,
            fontSize: 20
          ),
        ));
  }
}
