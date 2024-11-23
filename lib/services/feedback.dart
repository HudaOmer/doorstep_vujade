import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/feedback.dart';
import 'search.dart';

class FeedbackService {
  Future<bool> submitFeedback(FeedBack feedback, String token) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/feedback'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(feedback.toJson()),
      );
      print('success');
      print(response.headers);
      return response.statusCode ==
          201; // Check if feedback was submitted successfully
    } catch (e) {
      print('Error submitting feedback: $e');
      return false;
    }
  }
}
