import 'package:flutter/material.dart';
import '../global_widgets/custom_appbar.dart';
import '../utils/colors.dart';
import '../utils/icon.dart';

class ApartmentDetailScreen extends StatelessWidget {
  const ApartmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contrastColor,
      appBar: CustomAppBar(
        color: Colors.black26,
        image: notifications.mode[0],
        arrowColor: mainColor,
        actions: [
          Icon(Icons.favorite_outline, color: mainColor),
          const SizedBox(width: 5),
          Icon(Icons.bookmark_border, color: mainColor),
          const SizedBox(width: 25),
        ],
        body: [
          const Center(
            child: Text('',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 80),
          Container(height: 20)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: const [Center()],
              )),
        ),
      ),
    );
  }
}
