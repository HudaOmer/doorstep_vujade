import 'package:flutter/material.dart';
import '../global_widgets/colored_button.dart';
import '../utils/colors.dart';

double appbarheight = 80;

class AddCollectionScreen extends StatelessWidget {
  const AddCollectionScreen({super.key});

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
                Text('Collection Name      ', style: TextStyle(fontSize: 20))),
        leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context)),
      ),
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.only(right: 10, left: 10),
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey)),
          child: const TextField(showCursor: false),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Center(
            child: ColoredButton(
                color: mainColor, text: 'Create Collection', onPressed: () {})),
      ]),
    );
  }
}
