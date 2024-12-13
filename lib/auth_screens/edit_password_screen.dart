import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/auth.dart';
import '../global_widgets/colored_button.dart';
import '../global_widgets/decorated_text_field.dart';
import '../home_screens/navigation_screen.dart';
import '../utils/colors.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final AuthService _authService = AuthService();

  // Function to reset password
  Future<void> resetPassword(String password) async {
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final otp = prefs.getString('otp');
    bool success = await _authService.resetPassword(
      email!,
      password,
      otp!,
    );

    setState(() {
      isLoading = false;
    });

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationScreen()),
      );
    } else {
      // Show an error if resetting the password failed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to reset password. Please try again.')),
      );
    }
  }

  // Function to retrieve OTP from SharedPreferences
  Future<String?> _getStoredOtp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('otp'); // Retrieve OTP
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Center(
                  child: Text('Edit Password', style: TextStyle(fontSize: 26))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              DecoratedTextField(
                label: 'New Password',
                hint: '********',
                isObsecure: true,
                controller: passwordController,
                validator: (value) =>
                    value!.isEmpty ? 'Please Enter a password' : null,
              ),
              DecoratedTextField(
                label: 'Retype Password',
                hint: '********',
                isObsecure: true,
                controller: passwordConfirmController,
                validator: (value) =>
                    value!.isEmpty ? 'Please Enter a password' : null,
              ),
              const SizedBox(height: 30),
              ColoredButton(
                color: mainColor,
                text: isLoading ? 'Saving...' : 'Save',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    resetPassword(passwordController.text);
                  }
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
