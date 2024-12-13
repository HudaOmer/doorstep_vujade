import 'dart:convert';
import '../models/visit_request.dart';
import 'search.dart';
import 'package:http/http.dart' as http;

class VisitRequestService {
  // Fetch all visit requests
  Future<List<VisitRequest>> getVisitRequests(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/visit-requests'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['visit_requests'];
      return data.map((e) => VisitRequest.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load visit requests');
    }
  }

  // Create a new visit request
  Future<void> createVisitRequest(
      String token, VisitRequest visitRequest) async {
    final Uri url = Uri.parse('$baseUrl/visit-requests');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final Map<String, dynamic> body = {
      'property_id': visitRequest.property.id,
      'visitor_name': visitRequest.visitorName,
      'visitor_email': visitRequest.visitorEmail,
      'visit_date': visitRequest.visitDate,
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 201) {
        print('Visit request created successfully');
      } else {
        throw Exception(
            'Failed to create visit request. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to send visit request: $error');
    }
  }

  // Delete a visit request
  Future<void> deleteVisitRequest(String token, int visitRequestId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/visit-requests/$visitRequestId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete visit request');
    }
  }
}
