import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final double height;
  final String iconName;
  const CustomIcon({super.key, required this.height, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
            height: height,
            child: Image.asset(iconName, fit: BoxFit.fitHeight)));
  }
}
