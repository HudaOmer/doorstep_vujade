import 'package:flutter/material.dart';
import '../../global_widgets/apartment_item.dart';
import '../../global_widgets/custom_icon.dart';
import '../../utils/colors.dart';

class ReqApatrmentItem extends StatelessWidget {
  final bool isFav;
  const ReqApatrmentItem({super.key, required this.isFav});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 130,
        padding: const EdgeInsets.all(12.0),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('AL Rayyan', style: TextStyle(fontSize: 12)),
                    SizedBox(width: 100),
                    Icon(Icons.close)
                  ],
                ),
                const Text('9:00 AM - 10:00 AM',
                    style: TextStyle(fontSize: 12)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const LocationItem(location: 'Sudan'),
                    const SizedBox(width: 5),
                    Icon(Icons.edit, color: mainColor),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 30,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: contrastColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Text('Pending',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700))),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
