import 'package:flutter/material.dart';
import '../chat_screens/all_chats_screen.dart';
import '../global_widgets/custom_icon.dart';
import '../utils/icon.dart';
import 'home_screen.dart';
import 'lists_screen.dart';
import 'map_screen.dart';
import 'search_filter_screen.dart';

double iconSize = 35;

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const MapScreen(),
    const AllChatsScreen(),
    const SearchFilterScreen(),
    const ListsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (int newValue) {
              setState(() {
                currentIndex = newValue;
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: 'Home',
                  tooltip: 'Home',
                  icon: CustomIcon(
                      height: iconSize,
                      iconName: home.mode[currentIndex == 0 ? 0 : 1])),
              BottomNavigationBarItem(
                  label: 'Map',
                  tooltip: 'Map',
                  icon: CustomIcon(
                      height: iconSize,
                      iconName: map.mode[currentIndex == 1 ? 0 : 1])),
              BottomNavigationBarItem(
                  label: 'Add',
                  tooltip: 'Add',
                  icon: CustomIcon(
                      height: iconSize,
                      iconName: add.mode[currentIndex == 2 ? 0 : 1])),
              BottomNavigationBarItem(
                  label: 'Notifications',
                  tooltip: 'Notifications',
                  icon: CustomIcon(
                      height: iconSize,
                      iconName: notifications.mode[currentIndex == 3 ? 0 : 1])),
              BottomNavigationBarItem(
                  label: 'Sort',
                  tooltip: 'Sort',
                  icon: CustomIcon(
                      height: iconSize,
                      iconName: sort.mode[currentIndex == 4 ? 0 : 1])),
            ]),
      ),
    );
  }
}
