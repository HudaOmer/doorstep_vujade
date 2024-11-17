import 'package:flutter/material.dart';
import '../../models/property.dart';
import 'feature_box_widget.dart';
import '../../utils/data.dart';

class DescriptionWidget extends StatelessWidget {
  final Property property;
  const DescriptionWidget({super.key, required this.property});

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
                    feature: 'Bedrooms', value: property.bedrooms.toString()),
                FeatureBoxWidget(
                    feature: 'Loungs', value: apartment.lounge.toString()),
                FeatureBoxWidget(
                    feature: 'Toilets', value: property.bathrooms.toString()),
              ],
            ),
            Column(
              children: [
                FeatureBoxWidget(
                    feature: 'Category', value: property.propertyType),
                FeatureBoxWidget(
                    feature: 'Space', value: property.area.toString()),
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
