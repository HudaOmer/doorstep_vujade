import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class FeatureBoxWidget extends StatelessWidget {
  final String feature;
  final String value;
  const FeatureBoxWidget(
      {super.key, required this.feature, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: mediumGreyColor,
      height: 40,
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(feature,
              style:
                  const TextStyle(fontWeight: FontWeight.w300, fontSize: 13)),
          Text(value,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                  fontSize: 13)),
        ],
      ),
    );
  }
}
