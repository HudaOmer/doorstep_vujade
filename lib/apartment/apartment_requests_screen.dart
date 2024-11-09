import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'widgets/apartment_request_widget.dart';

class ApartmentRequestsScreen extends StatelessWidget {
  const ApartmentRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        title: const Center(
            child: Text('Requests      ', style: TextStyle(fontSize: 20))),
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            const ReqApatrmentItem(isFav: true),
            const ReqApatrmentItem(isFav: true),
            const Center(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}
