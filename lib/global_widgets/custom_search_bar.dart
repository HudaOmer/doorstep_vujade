import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.75,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0, right: 17.0, bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Icon(Icons.search, size: 20, color: Colors.grey)),
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.only(left: 17.0, right: 17.0, bottom: 5.0),
                child: TextFormField(
                  cursorColor: Colors.white,
                  decoration: const InputDecoration.collapsed(
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey)),
                ),
              )),
            ],
          ),
        ));
  }
}
