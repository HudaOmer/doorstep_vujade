import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPWidget extends StatefulWidget {
  const OTPWidget({super.key});

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  Future<void> _storeOtp(String otp) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('otp', otp);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    super.dispose();
  }

  void _submitOtp(BuildContext context) async {
    final otp =
        '${_controller1.text}${_controller2.text}${_controller3.text}${_controller4.text}';

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('otp', otp);

    if (otp.length == 4) {
      _storeOtp(otp);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('OTP Submitted: $otp')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all OTP fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildOtpTextField(_controller1, _focusNode1, _focusNode2),
        const SizedBox(width: 8),
        _buildOtpTextField(_controller2, _focusNode2, _focusNode3),
        const SizedBox(width: 8),
        _buildOtpTextField(_controller3, _focusNode3, _focusNode4),
        const SizedBox(width: 8),
        _buildOtpTextField(_controller4, _focusNode4, null),
      ],
    );
  }

  Widget _buildOtpTextField(TextEditingController controller,
      FocusNode focusNode, FocusNode? nextFocusNode) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (nextFocusNode != null) {
              FocusScope.of(focusNode.context!).requestFocus(nextFocusNode);
            } else {
              focusNode.unfocus();
              _submitOtp(focusNode.context!);
            }
          }
        },
      ),
    );
  }
}
