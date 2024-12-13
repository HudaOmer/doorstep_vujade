import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global_widgets/colored_button.dart';
import '../utils/colors.dart';
import 'edit_password_screen.dart';
import 'widgets/otp_widget.dart';

class OTPScreen extends StatefulWidget {
  final String email;
  const OTPScreen({super.key, required this.email});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool isLoading = false;

  // Function to verify OTP and reset password
  Future<void> verifyAndResetPassword(String otp) async {
    setState(() {
      isLoading = true;
    });
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const EditPasswordScreen()));
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            const Center(
                child:
                    Text('OTP Verification', style: TextStyle(fontSize: 26))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            const Text('Enter The Verification Code',
                style: TextStyle(fontSize: 20, color: Colors.grey)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            const OTPWidget(), // OTP Widget to enter OTP
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ColoredButton(
              color: mainColor,
              text: isLoading ? 'Verifying...' : 'Done',
              onPressed: () async {
                String? storedOtp = await _getStoredOtp();

                if (storedOtp != null && storedOtp.isNotEmpty) {
                  verifyAndResetPassword(storedOtp);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('OTP is missing or invalid')),
                  );
                }
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
