import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final double height;
  final double? width;
  final String iconName;
  const CustomIcon(
      {super.key, required this.height, required this.iconName, this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(width ?? 15),
        child: SizedBox(
            height: height,
            width: width,
            child: Image.asset(iconName, fit: BoxFit.fitHeight)));
  }
}
