import 'package:flutter/material.dart';
import '../models/favorite.dart';
import '../utils/colors.dart';
import '../services/favorite.dart';
import 'widgets/apartment_favorite_widget.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen({super.key});

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  late Future<List<Favorite>> favorites;
  final FavoriteService favoriteService = FavoriteService();

  @override
  void initState() {
    super.initState();
    favorites = favoriteService.fetchFavorites();
  }

  Future<void> _refreshFavorites() async {
    setState(() {
      favorites = favoriteService.fetchFavorites(); // Refresh the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        title: const Center(
            child: Text('Favorite List', style: TextStyle(fontSize: 20))),
        leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context)),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshFavorites, // Handle refresh
        child: FutureBuilder<List<Favorite>>(
          future: favorites,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No favorites found.'));
            }

            final favoriteList = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  for (var favorite in favoriteList)
                    FavApatrmentItem(
                      isFav: true,
                      property: favorite.property,
                    ),
                  const Center(child: SizedBox(height: 40)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
