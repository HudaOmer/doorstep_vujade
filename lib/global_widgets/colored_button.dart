import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final String? text;
  final void Function() onPressed;
  final double? size;
  const ColoredButton(
      {super.key,
      required this.color,
      this.icon,
      this.text,
      required this.onPressed,
      this.size = 0.8});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(backgroundColor: color),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width * size!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon!, color: Colors.white, size: 30),
            if (icon != null && text != null) const SizedBox(width: 20),
            if (text != null)
              Text(text!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Saken",
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
