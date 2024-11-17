import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../apartment/property_search_screen.dart';
import '../global_widgets/apartment_item.dart';
import '../global_widgets/custom_search_bar.dart';
import 'widgets/items_slider.dart';

double appbarheight = 80;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: appbarheight,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        leading: const Row(
          children: [
            SizedBox(width: 25),
            Icon(Icons.menu, size: 30),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.08),
            child: const LocationItem(location: 'Riyadh'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CustomSearchBar(),
                GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PropertySearchScreen())),
                    child: const Icon(Icons.settings))
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Distinctive',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: mainColor),
                  ),
                ],
              ),
            ),
            const ItemsSlider(maxPrice: 500000, isWide: true),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: mainColor),
                  ),
                ],
              ),
            ),
            const ItemsSlider(maxPrice: 300000, isWide: false),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
