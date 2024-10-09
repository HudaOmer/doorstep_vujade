import 'package:doorstep_vujade/global_widgets/apartment_item.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../global_widgets/custom_appbar.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: contrastColor,
        appBar: CustomAppBar(
            color: contrastColor,
            title: 'Book An Appointment    ',
            body: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      SizedBox(width: 20),
                      Text('Oct, 2024',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      WeekdayDateWidget(day: 'sun', date: '3', isToday: false),
                      WeekdayDateWidget(day: 'mon', date: '4', isToday: true),
                      WeekdayDateWidget(day: 'tue', date: '5', isToday: false),
                      WeekdayDateWidget(day: 'wed', date: '6', isToday: false),
                      WeekdayDateWidget(day: 'thu', date: '7', isToday: false),
                      WeekdayDateWidget(day: 'fri', date: '8', isToday: false),
                      WeekdayDateWidget(day: 'sat', date: '9', isToday: false),
                    ],
                  ),
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
                        const Text('Al Rayyan',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 10),
                        Text('5,000 SAR',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: mainColor)),
                        const SizedBox(height: 10),
                        Container(
                            height: 40,
                            width: 120,
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                color: contrastColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: LocationItem(
                                  location: 'Riyadh', color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 10),
                  Center(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3)),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ));
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
      width: 50,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: mainColor.withOpacity(isToday ? 0.2 : 0.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day,
              style: TextStyle(
                  color: isToday ? mainColor : Colors.white, fontSize: 13)),
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
