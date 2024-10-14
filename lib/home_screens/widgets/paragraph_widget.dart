import 'package:flutter/material.dart';
import '../../models/apartment.dart';

class ParagraphWidget extends StatelessWidget {
  final Apartment apartment;
  const ParagraphWidget({super.key, required this.apartment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(height: 10),
        Text(apartment.description,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
      ],
    );
  }
}
