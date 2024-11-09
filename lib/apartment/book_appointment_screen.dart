import 'package:doorstep_vujade/utils/data.dart';
import 'package:flutter/material.dart';
import '../global_widgets/colored_button.dart';
import '../home_screens/widgets/description_widget.dart';
import '../home_screens/widgets/detail_widget.dart';
import '../home_screens/widgets/paragraph_widget.dart';
import '../home_screens/widgets/reviews_widget.dart';
import '../utils/colors.dart';
import '../global_widgets/custom_appbar.dart';
import 'widgets/time_widget.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contrastColor,
      appBar: CustomAppBar(
          color: contrastColor,
          title: 'Book an Appointment    ',
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
          ]),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailWidget(apartment: apartment),
                      const SizedBox(height: 30),
                      ParagraphWidget(apartment: apartment),
                      const SizedBox(height: 30),
                      DescriptionWidget(apartment: apartment),
                      const SizedBox(height: 30),
                      const RequestWidget(),
                      const SizedBox(height: 30),
                      Center(
                        child: ColoredButton(
                            text: 'Send',
                            color: contrastColor,
                            onPressed: () {}),
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
