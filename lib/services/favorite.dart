import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/favorite.dart';
import 'search.dart';

class FavoriteService {
  Future<List<Favorite>> fetchFavorites() async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/favorites'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['favorites'];
      return data.map((favorite) => Favorite.fromJson(favorite)).toList();
    } else {
      throw Exception('Failed to load favorites');
    }
  }

  Future<void> addFavorite(int propertyId) async {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/favorites'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'property_id': propertyId,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add favorite');
    }
  }

  Future<void> removeFavorite(int propertyId) async {
    final token = await _getToken();
    final response = await http.delete(
      Uri.parse('$baseUrl/favorites/$propertyId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to remove favorite');
    }
  }

  Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
