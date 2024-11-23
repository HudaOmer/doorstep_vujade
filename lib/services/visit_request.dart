import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/visit_request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'search.dart';

class VisitRequestService {
  Future<List<VisitRequest>> fetchVisitRequests(int propertyId) async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/properties/$propertyId/visit-request'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print('Request URL: ${response.request?.url}');
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['property'];
      return data.map((request) => VisitRequest.fromJson(request)).toList();
    } else {
      throw Exception('Failed to load visit requests: ${response.body}');
    }
  }

  Future<void> createVisitRequest(VisitRequest request) async {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/properties/${request.propertyId}/visit-request'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'user_id': request.userId, // Include user_id in the payload
        'visitor_name': request.visitorName,
        'visitor_email': request.visitorEmail,
        'visit_date': request.visitDate,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create visit request');
    }
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
