import 'package:flutter/material.dart';
import '../../global_widgets/apartment_item.dart';
import '../../models/apartment.dart';
import '../../utils/colors.dart';

class DetailWidget extends StatelessWidget {
  final Apartment apartment;
  const DetailWidget({super.key, required this.apartment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(apartment.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        const SizedBox(height: 10),
        Text('${apartment.price} SAR',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: mainColor)),
        const SizedBox(height: 10),
        Container(
          height: 40,
          width: 120,
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: contrastColor, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child:
                LocationItem(location: apartment.location, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
