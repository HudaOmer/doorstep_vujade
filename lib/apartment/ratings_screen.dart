import 'package:flutter/material.dart';
import '../global_widgets/colored_button.dart';
import '../utils/colors.dart';

double appbarheight = 80;

class RatingsScreen extends StatelessWidget {
  const RatingsScreen({super.key});

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
            child:
                Text('Rating & Reviews      ', style: TextStyle(fontSize: 20))),
        leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (index) => const Icon(Icons.star_outline_rounded,
                        size: 40, color: Colors.grey))),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)),
              child:
                  const TextField(showCursor: false, minLines: 4, maxLines: 6),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ]),
          Center(
              child: ColoredButton(
                  color: mainColor, text: 'Post', onPressed: () {})),
        ],
      ),
    );
  }
}
