import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final imageUrl;
  final controller;

  CustomListView({required this.imageUrl, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: PageView.builder(
        controller: controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return (CachedNetworkImage(imageUrl: imageUrl[index]));
        },
      ),
    );
  }
}
