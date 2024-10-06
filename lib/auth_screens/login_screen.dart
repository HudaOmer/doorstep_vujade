import 'package:flutter/material.dart';
import '../global_widgets/colored_button.dart';
import '../global_widgets/colored_text_button.dart';
import '../global_widgets/decorated_text_field.dart';
import '../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Center(
                  child: Text('Log In', style: TextStyle(fontSize: 30))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              DecoratedTextField(
                  label: 'Email Address',
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
              ColoredTextButton(text: 'Forgot Password?', onPressed: () {}),
              SizedBox(height: MediaQuery.of(context).size.height * 0.12),
              ColoredButton(
                  color: mainColor,
                  text: 'Log in',
                  onPressed: () {
                    _formKey.currentState!.validate();
                  }),
              const SizedBox(height: 10),
              ColoredButton(
                  color: contrastColor,
                  text: 'Log in with Face ID',
                  onPressed: () {}),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}