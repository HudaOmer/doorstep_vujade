import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = 'http://192.168.100.87:8000/api';

class ApiService {
  Future<List<dynamic>> searchProperties(String token,
      {Map<String, String>? filters}) async {
    String url = '$baseUrl/search/properties';

    if (filters != null && filters.isNotEmpty) {
      final queryString = Uri(queryParameters: filters).query;
      url += '?$queryString';
    }

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    // Check the response status and parse the JSON
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load properties: ${response.body}');
    }
  }
}
