import 'package:flutter/material.dart';

import '../../models/apartment.dart';
import 'feature_box_widget.dart';

class DescriptionWidget extends StatelessWidget {
  final Apartment apartment;
  const DescriptionWidget({super.key, required this.apartment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                FeatureBoxWidget(
                    feature: 'Bedrooms', value: apartment.bedrooms.toString()),
                FeatureBoxWidget(
                    feature: 'Loungs', value: apartment.lounge.toString()),
                FeatureBoxWidget(
                    feature: 'Toilets', value: apartment.toilets.toString()),
              ],
            ),
            Column(
              children: [
                FeatureBoxWidget(
                    feature: 'Category', value: apartment.category),
                FeatureBoxWidget(feature: 'Space', value: apartment.space),
                FeatureBoxWidget(
                    feature: 'Coverage', value: apartment.coverage),
              ],
            ),
          ],
        )
      ],
    );
  }
}
