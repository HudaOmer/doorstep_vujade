import 'package:flutter/material.dart';
import '../../global_widgets/custom_icon.dart';
import '../../utils/colors.dart';
import '../view_category_screen.dart';

class CatApatrmentItem extends StatelessWidget {
  final String number;
  const CatApatrmentItem({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push((context),
          MaterialPageRoute(builder: (context) => const ViewCategoryScreen())),
      child: Padding(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('AL Rayyan', style: TextStyle(fontSize: 13)),
                  Text('$number+',
                      style: const TextStyle(fontSize: 13, color: Colors.grey)),
                  const SizedBox(height: 25),
                ],
              ),
              const SizedBox(width: 70),
              Icon(Icons.delete_outline, color: contrastColor, size: 25)
            ],
          ),
        ),
      ),
    );
  }
}
