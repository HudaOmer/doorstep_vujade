import 'package:flutter/material.dart';
import '../global_widgets/colored_button.dart';
import '../global_widgets/colored_text_button.dart';
import '../global_widgets/decorated_text_field.dart';
import '../home_screens/navigation_screen.dart';
import 'register_screen.dart';
import 'forget_password_screen.dart';
import '../utils/colors.dart';
import 'auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final AuthService _authService = AuthService();

  Future<void> loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    bool success =
        await _authService.login(emailController.text, passwordController.text);

    if (success) {
      // Navigate to home screen
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const NavigationScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Login failed. Please check your credentials.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              const Center(
                  child: Text('Log In', style: TextStyle(fontSize: 30))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              DecoratedTextField(
                  label: 'Email',
                  hint: 'SomeOne@email.com',
                  isObsecure: false,
                  controller: emailController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please Enter a valid email' : null),
              DecoratedTextField(
                  label: 'Password',
                  hint: '********',
                  isObsecure: true,
                  controller: passwordController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please Enter a password' : null),
              const SizedBox(height: 10),
              ColoredTextButton(
                  text: 'Forgot Password?',
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgetPasswordScreen()))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ColoredButton(
                  color: mainColor,
                  text: 'Log in',
                  onPressed: ()
                      // => Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const NavigationScreen()))
                      async {
                    _formKey.currentState!.validate();
                    await loginUser();
                  }),
              const SizedBox(height: 10),
              ColoredButton(
                  color: contrastColor,
                  text: 'Register',
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  }),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
