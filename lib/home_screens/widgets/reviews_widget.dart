import 'package:flutter/material.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Reviews',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_border),
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
