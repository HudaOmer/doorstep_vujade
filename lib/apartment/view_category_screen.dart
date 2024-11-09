import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'widgets/apartment_saved_widget.dart';

class ViewCategoryScreen extends StatelessWidget {
  const ViewCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        title: const Center(
            child: Text('View Category      ', style: TextStyle(fontSize: 20))),
        leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                const Text('AL Rayyan',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              ],
            ),
            const SaveApatrmentItem(isSaved: true),
            const SaveApatrmentItem(isSaved: true),
            const Center(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}
