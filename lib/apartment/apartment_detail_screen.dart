import 'package:flutter/material.dart';
import '../chat_screens/chat_screen.dart';
import '../global_widgets/colored_button.dart';
import '../global_widgets/custom_appbar.dart';
import '../home_screens/widgets/description_widget.dart';
import '../home_screens/widgets/detail_widget.dart';
import '../home_screens/widgets/paragraph_widget.dart';
import '../home_screens/widgets/reviews_widget.dart';
import '../utils/colors.dart';
import '../utils/data.dart';
import 'book_appointment_screen.dart';

class ApartmentDetailScreen extends StatelessWidget {
  const ApartmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contrastColor,
      appBar: CustomAppBar(
        color: Colors.black26,
        image: apartment.imageUrl,
        arrowColor: mainColor,
        onTap: () => Navigator.pop(context),
        actions: [
          Icon(Icons.favorite_outline, color: mainColor),
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
                    DetailWidget(apartment: apartment),
                    const SizedBox(height: 30),
                    ParagraphWidget(apartment: apartment),
                    const SizedBox(height: 30),
                    DescriptionWidget(apartment: apartment),
                    const SizedBox(height: 30),
                    const RequestWidget(),
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
                                        const BookAppointmentScreen())),
                            size: 0.26),
                        ColoredButton(
                            icon: Icons.phone,
                            text: 'Call',
                            color: contrastColor,
                            onPressed: () {},
                            size: 0.26),
                        ColoredButton(
                            icon: Icons.message_rounded,
                            color: Colors.grey,
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChatScreen())),
                            size: 0.2),
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
