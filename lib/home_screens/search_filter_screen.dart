import 'package:flutter/material.dart';
import '../global_widgets/colored_button.dart';
import '../utils/colors.dart';
import 'widgets/filter_widget.dart';

double appbarheight = 80;

class SearchFilterScreen extends StatelessWidget {
  const SearchFilterScreen({super.key});

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
            child: Text('Filter      ', style: TextStyle(fontSize: 20))),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(width: 30),
                FilterWidget(filterName: 'price'),
                SizedBox(width: 30),
                FilterWidget(filterName: 'Animal Facilities')
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(width: 30),
                FilterWidget(filterName: 'Modern'),
                SizedBox(width: 30),
                FilterWidget(filterName: 'Air Conditioner')
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(width: 30),
                FilterWidget(filterName: 'Car Entrance')
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.4),
            Center(
                child: ColoredButton(
                    color: mainColor, text: 'Done', onPressed: () {})),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
