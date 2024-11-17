import 'package:flutter/material.dart';
import '../../global_widgets/apartment_item.dart';
import '../../models/property.dart';
import '../../utils/colors.dart';

class DetailWidget extends StatelessWidget {
  final Property property;
  const DetailWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(property.title,
              maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ),
        const SizedBox(height: 10),
        Text('${property.price} SAR',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: mainColor)),
        const SizedBox(height: 10),
        Container(
          height: 40,
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: contrastColor, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: LocationItem(
                  location: property.location, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
