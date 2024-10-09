import 'package:flutter/material.dart';
import '../global_widgets/custom_appbar.dart';
import '../utils/colors.dart';
import '../utils/icon.dart';

class FertilizationScreen extends StatelessWidget {
  const FertilizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contrastColor,
      appBar: CustomAppBar(
        color: Colors.black26,
        image: notifications.mode[0],
        body: [
          const Center(
            child: Text('Fertilization History',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 80),
          Container(
            height: 20,
            decoration: BoxDecoration(
                color: contrastColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: contrastColor,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Date',
                          style:
                              TextStyle(color: mediumGreyColor, fontSize: 11)),
                      Text('Fertilizer Type',
                          style:
                              TextStyle(color: mediumGreyColor, fontSize: 11)),
                      Text('Space',
                          style:
                              TextStyle(color: mediumGreyColor, fontSize: 11)),
                    ],
                  ),
                  Container(
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      color: Colors.grey),
                  const RowItem(),
                  const RowItem(),
                  const RowItem(),
                  const RowItem()
                ],
              )),
        ),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('1/1/2025',
              style: TextStyle(color: mediumGreyColor, fontSize: 11)),
          Text('A', style: TextStyle(color: mediumGreyColor, fontSize: 11)),
          Text('100m2', style: TextStyle(color: mediumGreyColor, fontSize: 11)),
        ],
      ),
    );
  }
}
