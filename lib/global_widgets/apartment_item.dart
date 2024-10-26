import 'package:flutter/material.dart';
import '../apartment/apartment_detail_screen.dart';
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
        const SizedBox(width: 4),
        Text(location, style: TextStyle(color: color, fontSize: 12)),
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
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const ApartmentDetailScreen())),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            width: isWide ? 250 : 170,
            height: 240,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15), bottom: Radius.circular(15)),
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
                    height: 120,
                    iconName: isWide
                        ? 'assets/images/buildings.jpeg'
                        : 'assets/images/villa.jpeg'),
                const SizedBox(height: 5),
                const Row(
                  children: [
                    SizedBox(width: 5),
                    Text('AL Rayyan', style: TextStyle(fontSize: 12))
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.access_time, size: 20),
                    SizedBox(width: 4),
                    Text('15 Oct, 2024', style: TextStyle(fontSize: 12)),
                  ],
                ),
                const LocationItem(location: 'Riyadh')
              ],
            )),
      ),
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
          width: 300,
          height: 120,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15), bottom: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, -2)),
            ],
          ),
          child: const Row(
            children: [
              CustomIcon(height: 80, iconName: 'assets/images/buildings.jpeg'),
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AL Rayyan', style: TextStyle(fontSize: 12)),
                  Text('2,000 SAR', style: TextStyle(fontSize: 12)),
                  LocationItem(location: 'Sudan')
                ],
              ),
            ],
          )),
    );
  }
}
