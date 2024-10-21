import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'widgets/apartment_favorite_widget.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        title: const Center(
            child: Text('Favorite List      ', style: TextStyle(fontSize: 20))),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            const FavApatrmentItem(isFav: true),
            const FavApatrmentItem(isFav: true),
            const Center(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}
