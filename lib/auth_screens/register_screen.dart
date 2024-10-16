import 'package:flutter/material.dart';
import '../global_widgets/colored_button.dart';
import '../global_widgets/decorated_text_field.dart';
import '../utils/colors.dart';
import 'login_Screen.dart';

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
        leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()))),
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
                  controller: _passwordController,
                  label: 'Password',
                  hint: '********',
                  isObsecure: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Please Enter a valid password' : null),
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
