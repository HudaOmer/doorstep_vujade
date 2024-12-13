import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/property.dart';
import '../models/visit_request.dart';
import '../services/visit_request.dart';
import '../global_widgets/colored_button.dart';
import '../utils/colors.dart';
import 'widgets/time_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/detail_widget.dart';
import 'widgets/paragraph_widget.dart';
import 'widgets/reviews_widget.dart';
import '../global_widgets/custom_appbar.dart';

class BookAppointmentScreen extends StatefulWidget {
  final Property property;
  const BookAppointmentScreen({super.key, required this.property});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final VisitRequestService _visitRequestService = VisitRequestService();
  late String _token;
  final String _visitorName = "User";
  final String _visitorEmail = 'test@example.com';
  final String _visitDate = DateTime.now().toString();

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token') ?? '';
    if (_token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not authenticated')),
      );
    }

    print(_token);
  }

  Future<void> _sendVisitRequest() async {
    if (_token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You need to log in first')),
      );
      return;
    }

    final visitRequest = VisitRequest(
      property: widget.property,
      visitorName: _visitorName,
      visitorEmail: _visitorEmail,
      visitDate: _visitDate,
      requestedAt: DateTime.now().toString(),
    );

    try {
      await _visitRequestService.createVisitRequest(_token, visitRequest);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Visit request sent successfully')),
      );
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send request: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contrastColor,
      appBar: CustomAppBar(
        color: contrastColor,
        title: 'Book an Appointment',
        onTap: () => Navigator.pop(context),
        body: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  SizedBox(width: 20),
                  Text('Oct, 2024',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WeekdayDateWidget(day: 'sun', date: '3', isToday: false),
                  WeekdayDateWidget(day: 'mon', date: '4', isToday: true),
                  WeekdayDateWidget(day: 'tue', date: '5', isToday: false),
                  WeekdayDateWidget(day: 'wed', date: '6', isToday: false),
                  WeekdayDateWidget(day: 'thu', date: '7', isToday: false),
                  WeekdayDateWidget(day: 'fri', date: '8', isToday: false),
                  WeekdayDateWidget(day: 'sat', date: '9', isToday: false),
                ],
              ),
              const SizedBox(height: 15),
              const TimeWidget(from: '00:00', to: '00:00'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [DetailWidget(property: widget.property)]),
                      const SizedBox(height: 30),
                      ParagraphWidget(property: widget.property),
                      const SizedBox(height: 30),
                      DescriptionWidget(property: widget.property),
                      const SizedBox(height: 30),
                      const RequestWidget(),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () => print('Button pressed'), // For debug
                        child: Center(
                          child: ColoredButton(
                              text: 'Send',
                              color: contrastColor,
                              onPressed: () async {
                                // Properly calling the function
                                print('Sending visit request...');
                                await _sendVisitRequest();
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeekdayDateWidget extends StatelessWidget {
  final String day;
  final String date;
  final bool isToday;
  const WeekdayDateWidget(
      {super.key,
      required this.day,
      required this.date,
      required this.isToday});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47,
      height: 62,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: mainColor.withOpacity(isToday ? 0.2 : 0.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day,
              style: TextStyle(
                  color: isToday ? mainColor : Colors.white, fontSize: 12)),
          Text(date,
              style: TextStyle(
                  color: isToday ? mainColor : Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 11)),
        ],
      ),
    );
  }
}
