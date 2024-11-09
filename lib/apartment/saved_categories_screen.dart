import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'add_collection_screen.dart';
import 'widgets/apartment_categories_widget.dart';

class SavedCategoriesScreen extends StatelessWidget {
  const SavedCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        title: const Center(
            child:
                Text('Saved Categories     ', style: TextStyle(fontSize: 20))),
        leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context)),
        actions: [
          GestureDetector(
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.add),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddCollectionScreen()))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            const CatApatrmentItem(number: '100'),
            const CatApatrmentItem(number: '50'),
            const Center(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}
