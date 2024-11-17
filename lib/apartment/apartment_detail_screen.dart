import 'package:doorstep_vujade/utils/data.dart';
import 'package:flutter/material.dart';
import '../chat_screens/chat_screen.dart';
import '../global_widgets/colored_button.dart';
import '../global_widgets/custom_appbar.dart';
import '../models/favorite.dart';
import '../models/property.dart';
import '../services/favorite.dart';
import 'widgets/description_widget.dart';
import 'widgets/detail_widget.dart';
import 'widgets/paragraph_widget.dart';
import 'widgets/reviews_widget.dart';
import '../utils/colors.dart';
import 'book_appointment_screen.dart';

class ApartmentDetailScreen extends StatefulWidget {
  final dynamic propertyJSON;
  final Property? propertyReady;

  const ApartmentDetailScreen(
      {super.key, this.propertyJSON, this.propertyReady});

  @override
  State<ApartmentDetailScreen> createState() => _ApartmentDetailScreenState();
}

class _ApartmentDetailScreenState extends State<ApartmentDetailScreen> {
  late Property property;
  bool isFavorited = false; // Track favorite status
  final FavoriteService favoriteService =
      FavoriteService(); // Initialize the service

  @override
  void initState() {
    super.initState();
    property = widget.propertyReady != null
        ? widget.propertyReady!
        : Property.fromJson(widget.propertyJSON);
    _checkIfFavorite(); // Check if the property is already a favorite
  }

  void _checkIfFavorite() async {
    List<Favorite> favorites = await favoriteService.fetchFavorites();
    setState(() {
      isFavorited =
          favorites.any((favorite) => favorite.propertyId == property.id);
    });
  }

  void toggleFavorite() async {
    if (isFavorited) {
      await favoriteService.removeFavorite(property.id!);
      setState(() {
        isFavorited = false;
      });
    } else {
      await favoriteService.addFavorite(property.id!);
      setState(() {
        isFavorited = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contrastColor,
      appBar: CustomAppBar(
        color: Colors.black26,
        image: apartment.imageUrl, // Use property.imageUrl
        arrowColor: mainColor,
        onTap: () => Navigator.pop(context),
        actions: [
          GestureDetector(
            onTap: toggleFavorite, // Call toggleFavorite on tap
            child: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_outline,
              color: mainColor,
            ),
          ),
          const SizedBox(width: 5),
          Icon(Icons.bookmark_border, color: mainColor),
          const SizedBox(width: 25),
        ],
        body: [
          const Center(
            child: Text('',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 60),
          Container(height: 20)
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DetailWidget(property: property),
                        Row(
                          children: [
                            const Icon(Icons.remove_red_eye_outlined),
                            const SizedBox(width: 5),
                            Text(property.viewCount.toString()),
                            const SizedBox(width: 18),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ParagraphWidget(property: property),
                    const SizedBox(height: 30),
                    DescriptionWidget(property: property),
                    const SizedBox(height: 30),
                    const ReviewsWidget(),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ColoredButton(
                          icon: Icons.calendar_month_rounded,
                          text: 'Book',
                          color: mainColor,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BookAppointmentScreen(property: property),
                            ),
                          ),
                          size: 0.26,
                        ),
                        ColoredButton(
                          icon: Icons.phone,
                          text: 'Call',
                          color: contrastColor,
                          onPressed: () {},
                          size: 0.26,
                        ),
                        ColoredButton(
                          icon: Icons.message_rounded,
                          color: Colors.grey,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatScreen()),
                          ),
                          size: 0.2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
