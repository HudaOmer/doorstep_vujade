import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import '../global_widgets/colored_button.dart';
import '../global_widgets/decorated_text_field.dart';
import '../home_screens/navigation_screen.dart';
import '../services/auth.dart';
import '../utils/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    bool success = await _authService.register(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
      _phoneController.text,
      "2",
    );

    if (success) {
      // Navigate to the login screen or home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration failed. Please try again.')),
      );
    }
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              const Center(
                  child: Text('Register', style: TextStyle(fontSize: 30))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              DecoratedTextField(
                  controller: _nameController,
                  label: 'Name',
                  hint: 'First Last',
                  isObsecure: false,
                  validator: (value) =>
                      value!.isEmpty ? 'Please Enter Your name' : null),
              DecoratedTextField(
                  controller: _emailController,
                  label: 'Email',
                  hint: 'SomeOne@email.com',
                  isObsecure: false,
                  validator: (value) =>
                      value!.isEmpty ? 'Please Enter a valid email' : null),
              DecoratedTextField(
                  controller: _phoneController,
                  label: 'Phone',
                  hint: '+249961077805',
                  isObsecure: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    // Example regex for validating international phone numbers
                    final RegExp phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
                    if (!phoneRegex.hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  }),
              DecoratedTextField(
                  controller: _passwordController,
                  label: 'Password',
                  hint: '********',
                  isObsecure: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (!validator.isLength(value, 8)) {
                      return 'Password must be at least 8 characters';
                    }
                    if (!validator.isAlphanumeric(value)) {
                      return 'Password must contain letters and numbers';
                    }
                    return null;
                  }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              ColoredButton(
                  color: contrastColor,
                  text: 'Register',
                  onPressed: () async {
                    _formKey.currentState!.validate();
                    await registerUser();
                  }),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
