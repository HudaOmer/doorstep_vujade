import 'package:flutter/material.dart';
import 'auth_screens/edit_password_screen.dart';
import 'auth_screens/forget_password_screen.dart';
import 'auth_screens/login_screen.dart';
import 'auth_screens/otp_screen.dart';
import 'auth_screens/register_screen.dart';
import 'auth_screens/verification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoorStep',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const VerificationScreen(),
    );
  }
}
