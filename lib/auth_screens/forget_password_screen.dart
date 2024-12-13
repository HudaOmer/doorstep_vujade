import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../global_widgets/colored_button.dart';
import '../global_widgets/decorated_text_field.dart';
import '../utils/colors.dart';
import 'otp_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final AuthService _authService = AuthService();

  Future<void> sendForgotPasswordRequest(String email) async {
    setState(() {
      isLoading = true;
    });

    bool success = await _authService.sendOtp(email);

    setState(() {
      isLoading = false;
    });

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(email: email),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send OTP. Please try again.')),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Center(
                  child:
                      Text('Forget Password', style: TextStyle(fontSize: 26))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              DecoratedTextField(
                label: 'Email',
                hint: 'SomeOne@email.com',
                isObsecure: false,
                controller: emailController,
                validator: (value) =>
                    value!.isEmpty ? 'Please Enter a valid email' : null,
              ),
              const SizedBox(height: 30),
              ColoredButton(
                color: contrastColor,
                text: isLoading ? 'Sending...' : 'Send Instructions',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendForgotPasswordRequest(emailController.text);
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
