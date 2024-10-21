import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'widgets/profile_field_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        title: const Center(
            child: Text('Edit Profile      ', style: TextStyle(fontSize: 20))),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Icon(Icons.account_circle, size: 150, color: mainColor),
            const ProfileFieldWidget(
                label: 'Name', hint: 'Someone', isObsecure: false),
            const ProfileFieldWidget(
                label: 'Email', hint: 'SomeOne@email.com', isObsecure: false),
            const ProfileFieldWidget(
              label: 'Password',
              hint: '********',
              isObsecure: true,
            ),
            const ProfileFieldWidget(
              label: 'Date of birth',
              hint: '10/10/2015',
              isObsecure: false,
            ),
            const ProfileFieldWidget(
                label: 'Countery / Region',
                hint: 'Saudi Arabia',
                isObsecure: false),
            const Center(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}
