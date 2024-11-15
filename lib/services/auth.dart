import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'http://192.168.100.87:8000/api/auth';

  Future<bool> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final user = json.decode(response.body);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user['token']);
      return true; // Login successful
    } else {
      return false; // Login failed
    }
  }

  Future<bool> register(String name, String email, String password,
      String phoneNumber, String userType) async {
    final url = Uri.parse('$baseUrl/register');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password, // Include this for confirmation
        'phone_number': phoneNumber,
        'user_type': userType,
      }),
    );

    if (response.statusCode == 201) {
      final user = json.decode(response.body);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user['token']);
      return true; // Registration successful
    } else {
      return false; // Registration failed
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Remove the token on logout
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null; // Check for token
  }
}
