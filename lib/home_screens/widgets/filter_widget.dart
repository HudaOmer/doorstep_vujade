import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final String filterName;
  const FilterWidget({super.key, required this.filterName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.only(left: 17.0, right: 17.0, bottom: 5.0),
        child: Text(filterName,
            style: const TextStyle(fontSize: 13, color: Colors.grey)),
      ),
    );
  }
}
