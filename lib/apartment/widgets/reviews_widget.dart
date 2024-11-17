import 'package:flutter/material.dart';

import '../ratings_screen.dart';
import '../../utils/colors.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Reviews',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.star_rounded),
            const Icon(Icons.star_rounded),
            const Icon(Icons.star_rounded),
            const Icon(Icons.star_half_rounded),
            const Icon(Icons.star_border_rounded),
            const SizedBox(width: 10),
            GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RatingsScreen())),
                child: Icon(Icons.add_box_outlined, color: mainColor))
          ],
        )
      ],
    );
  }
}

class RequestWidget extends StatelessWidget {
  const RequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.check_circle_outline_outlined),
            SizedBox(width: 10),
            Text('Request door lock code',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          ],
        )
      ],
    );
  }
}
