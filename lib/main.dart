import 'package:flutter/material.dart';
import 'auth_screens/login_screen.dart';

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
        theme: ThemeData(colorSchemeSeed: Colors.orange),
        home: const LoginScreen()
        // isLoggedIn ? const NavigationScreen() : const LoginScreen()
        );
  }
}
