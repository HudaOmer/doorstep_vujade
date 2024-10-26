import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../global_widgets/apartment_item.dart';
import '../global_widgets/custom_search_bar.dart';

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
                right: MediaQuery.of(context).size.width * 0.02),
            child: const LocationItem(location: 'Riyadh'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [CustomSearchBar(), Icon(Icons.settings)],
            ),
            const SizedBox(height: 30),
            const Padding(
              padding:  EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text('Distinctive',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:  [
                    ApatrmentItem(isWide: true),
                    ApatrmentItem(isWide: true),
                    ApatrmentItem(isWide: true)
                  ],
                )),
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
            const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:  [
                    ApatrmentItem(isWide: false),
                    ApatrmentItem(isWide: false),
                    ApatrmentItem(isWide: false)
                  ],
                )),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
