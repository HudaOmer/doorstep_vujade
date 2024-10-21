import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class ProfileFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final bool isObsecure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final double? size;

  const ProfileFieldWidget(
      {super.key,
      required this.label,
      required this.isObsecure,
      required this.hint,
      this.controller,
      this.validator,
      this.borderColor = const Color.fromARGB(255, 66, 66, 74),
      this.size = 0.8});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 15)),
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width * size!,
          alignment: Alignment.center,
          child: TextFormField(
            obscureText: isObsecure,
            obscuringCharacter: '*',
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 15.0),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor!, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor!, width: 2),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
      ],
    );
  }
}
