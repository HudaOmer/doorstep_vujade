import 'package:flutter/material.dart';
import 'custom_icon.dart';

class LocationItem extends StatelessWidget {
  final String location;
  final Color color;
  const LocationItem(
      {super.key,
      required this.location,
      this.color = const Color.fromARGB(255, 254, 137, 23)});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, color: color),
        const SizedBox(width: 10),
        Text(location, style: TextStyle(color: color)),
        const SizedBox(width: 20),
      ],
    );
  }
}

class ApatrmentItem extends StatelessWidget {
  final bool isWide;
  const ApatrmentItem({
    super.key,
    required this.isWide,
  });

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
            children: [
              CustomIcon(
                  height: 130,
                  iconName: isWide
                      ? 'assets/images/buildings.jpeg'
                      : 'assets/images/villa.jpeg'),
              const Text('AL Rayyan', style: TextStyle(fontSize: 13)),
              const Text('2,000 SAR', style: TextStyle(fontSize: 13)),
              const LocationItem(location: 'Sudan')
            ],
          )),
    );
  }
}

class HorizantalApatrmentItem extends StatelessWidget {
  const HorizantalApatrmentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          width: 450,
          height: 120,
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
          child: Row(
            children: [
              const CustomIcon(
                  height: 130, iconName: 'assets/images/buildings.jpeg'),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('AL Rayyan', style: TextStyle(fontSize: 13)),
                  Text('2,000 SAR', style: TextStyle(fontSize: 13)),
                  LocationItem(location: 'Sudan')
                ],
              ),
            ],
          )),
    );
  }
}
