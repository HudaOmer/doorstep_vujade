import 'package:flutter/material.dart';
import '../global_widgets/colored_button.dart';
import '../services/feedback.dart';
import '../services/shared_preferences_helper.dart';
import '../utils/colors.dart';
import '../models/feedback.dart';

double appbarheight = 80;

class RatingsScreen extends StatefulWidget {
  final int userId; // Add userId for submitting feedback
  final int propertyId; // Add propertyId for the feedback

  const RatingsScreen(
      {super.key, required this.userId, required this.propertyId});

  @override
  State<RatingsScreen> createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  int rating = 0; // To hold selected rating
  String comment = '';
  final FeedbackService feedbackService = FeedbackService();
  final TextEditingController commentController = TextEditingController();
  String? token;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    token = await SharedPreferencesHelper.getToken();
    setState(() {});
  }

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
            child: Text('Rating & Reviews', style: TextStyle(fontSize: 20))),
        leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context)),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => IconButton(
              icon: Icon(
                index < rating ? Icons.star : Icons.star_outline,
                size: 40,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  rating = index + 1;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Row(children: [SizedBox(width: 40), Text("Comment")]),
        const SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            controller: commentController,
            onChanged: (value) {
              setState(() {
                comment = value;
              });
            },
            minLines: 4,
            maxLines: 6,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Center(
          child: ColoredButton(
            color: mainColor,
            text: 'Post',
            onPressed: () async {
              if (rating > 0 && token != null) {
                FeedBack feedback = FeedBack(
                  userId: widget.userId,
                  propertyId: widget.propertyId,
                  rating: rating,
                  comment: comment,
                );
                bool success =
                    await feedbackService.submitFeedback(feedback, token!);
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Feedback submitted successfully!')),
                  );
                  Navigator.pop(context); // Optionally navigate back
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to submit feedback.')),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          'Please select a rating and ensure you are logged in.')),
                );
              }
            },
          ),
        ),
      ]),
    );
  }
}
