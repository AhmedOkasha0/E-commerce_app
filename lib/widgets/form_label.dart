import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {

  String label;
  FormLabel({required this.label});
  @override
  Widget build(BuildContext context) {
    return Text (label,style: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),);
  }
}
