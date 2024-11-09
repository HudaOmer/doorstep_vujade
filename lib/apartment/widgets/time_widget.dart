import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class TimeWidget extends StatelessWidget {
  final String from;
  final String to;
  const TimeWidget({super.key, required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(width: 20),
      Icon(Icons.access_time, color: mainColor),
      const SizedBox(width: 10),
      Container(
          width: 80,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white, width: 1)),
          child: Center(
              child: Text(from,
                  style: const TextStyle(color: Colors.white, fontSize: 12)))),
      const SizedBox(width: 10),
      const Text('TO', style: TextStyle(color: Colors.white)),
      const SizedBox(width: 10),
      Container(
          width: 80,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white, width: 1)),
          child: Center(
              child: Text(to,
                  style: const TextStyle(color: Colors.white, fontSize: 12)))),
    ]);
  }
}
