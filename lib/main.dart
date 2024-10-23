import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_screens/edit_password_screen.dart';
import 'auth_screens/forget_password_screen.dart';
import 'auth_screens/login_screen.dart';
import 'auth_screens/otp_screen.dart';
import 'auth_screens/register_screen.dart';
import 'auth_screens/verification_screen.dart';
import 'chat_screens/chat_screen.dart';
import 'home_screens/navigation_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final prefs = await SharedPreferences.getInstance();
  // final token = prefs.getString('token'); // Retrieve token

  runApp(const MyApp());
  // isLoggedIn: token != null
}

class MyApp extends StatelessWidget {
  // final bool isLoggedIn;

  const MyApp({
    super.key,
    //  required this.isLoggedIn
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DoorStep',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        home: const NavigationScreen()
        // isLoggedIn ? const NavigationScreen() : const LoginScreen()
        );
  }
}
