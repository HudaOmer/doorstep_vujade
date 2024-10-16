import 'package:flutter/material.dart';
import '../global_widgets/colored_button.dart';
import '../global_widgets/decorated_text_field.dart';
import '../utils/colors.dart';
import 'forget_password_screen.dart';
import 'verification_screen.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
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
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ForgetPasswordScreen()))),
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
                      value!.isEmpty ? 'Please Enter a password' : null),
              DecoratedTextField(
                  label: 'Retype Password',
                  hint: '********',
                  isObsecure: true,
                  controller: passwordConfirmController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please Enter a password' : null),
              const SizedBox(height: 30),
              ColoredButton(
                  color: mainColor,
                  text: 'Save',
                  onPressed: () {
                    _formKey.currentState!.validate();
                    (Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerificationScreen())));
                  }),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
