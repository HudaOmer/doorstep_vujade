import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'custom_icon.dart';

class LocationItem extends StatelessWidget {
  final String location;
  const LocationItem({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, color: mainColor),
        const SizedBox(width: 10),
        Text(location, style: TextStyle(color: mainColor)),
        const SizedBox(width: 20),
      ],
    );
  }
}

class ApatrmentItem extends StatelessWidget {
  final bool isWide;
  const ApatrmentItem({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          width: isWide ? 250 : 170,
          height: 230,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30), bottom: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, -2)),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomIcon(height: 130, iconName: 'assets/images/icons/Bell.png'),
              Text('AL Rayyan', style: TextStyle(fontSize: 13)),
              Text('2,000 SAR', style: TextStyle(fontSize: 13)),
              LocationItem(location: 'Sudan')
            ],
          )),
    );
  }
}
