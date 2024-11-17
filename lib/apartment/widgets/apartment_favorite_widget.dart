import 'package:flutter/material.dart';
import '../../global_widgets/apartment_item.dart';
import '../../global_widgets/custom_icon.dart';
import '../../models/property.dart';
import '../../utils/colors.dart';
import '../apartment_detail_screen.dart';

class FavApatrmentItem extends StatelessWidget {
  final bool isFav;
  final Property property;

  const FavApatrmentItem(
      {super.key, required this.isFav, required this.property});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ApartmentDetailScreen(propertyReady: property))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 120,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                const CustomIcon(
                    height: 80, iconName: 'assets/images/buildings.jpeg'),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(property.title,
                          style: const TextStyle(fontSize: 12)),
                    ),
                    Text('${property.price} SAR',
                        style: const TextStyle(fontSize: 10)),
                    LocationItem(location: property.location),
                  ],
                ),
                const SizedBox(width: 15),
                Icon(isFav ? Icons.favorite : Icons.favorite_outline,
                    color: mainColor),
              ],
            ),
          ),
        ));
  }
}
