import 'package:flutter/material.dart';
import '../global_widgets/apartment_item.dart';
import '../utils/colors.dart';

double appbarheight = 80;

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: appbarheight,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        title: const Center(
            child: Text('Search Results     ', style: TextStyle(fontSize: 20))),
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                color: mediumGreyColor,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text('4 Results Found',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w700)),
                )),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(width: 10),
                ApatrmentItem(isWide: false),
                ApatrmentItem(isWide: false)
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(width: 10),
                ApatrmentItem(isWide: false),
                ApatrmentItem(isWide: false)
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
