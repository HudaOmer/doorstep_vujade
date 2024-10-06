import 'package:flutter/material.dart';

import '../global_widgets/colored_button.dart';
import '../global_widgets/decorated_text_field.dart';
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

  // final _phoneController = TextEditingController();
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              const Center(
                  child: Text('Register', style: TextStyle(fontSize: 30))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              DecoratedTextField(
                  controller: _nameController,
                  label: 'Name',
                  hint: 'First Last',
                  isObsecure: false),
              DecoratedTextField(
                  controller: _emailController,
                  label: 'Email',
                  hint: 'SomeOne@email.com',
                  isObsecure: false),
              DecoratedTextField(
                  controller: _passwordController,
                  label: 'Password',
                  hint: '********',
                  isObsecure: true),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              ColoredButton(
                  color: contrastColor,
                  text: 'Register',
                  onPressed: () {
                    _formKey.currentState!.validate();
                  }),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
