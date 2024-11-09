import 'package:flutter/material.dart';
import '../../global_widgets/apartment_item.dart';
import '../../global_widgets/custom_icon.dart';

class SaveApatrmentItem extends StatelessWidget {
  final bool isSaved;
  const SaveApatrmentItem({super.key, required this.isSaved});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                offset: const Offset(0, -2)),
          ],
        ),
        child: Row(
          children: [
            const CustomIcon(
                height: 80, iconName: 'assets/images/buildings.jpeg'),
            const SizedBox(width: 15),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('AL Rayyan', style: TextStyle(fontSize: 13)),
                Text('2,000 SAR', style: TextStyle(fontSize: 13)),
                LocationItem(location: 'Sudan')
              ],
            ),
            const SizedBox(width: 70),
            Icon(
                isSaved
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_outline_rounded,
                color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
