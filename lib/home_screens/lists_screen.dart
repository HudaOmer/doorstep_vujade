import 'package:flutter/material.dart';
import '../apartment/apartment_requests_screen.dart';
import '../apartment/favorite_list_screen.dart';
import '../apartment/saved_categories_screen.dart';
import '../auth_screens/login_screen.dart';
import '../global_widgets/colored_button.dart';
import '../utils/colors.dart';
import '../auth_screens/edit_profile_screen.dart';
import '../auth_screens/auth.dart';

double appbarheight = 80;

class ListsScreen extends StatefulWidget {
  const ListsScreen({super.key});

  @override
  State<ListsScreen> createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen> {
  final AuthService _authService = AuthService();
  Future<void> logout(BuildContext context) async {
    await _authService.logout(); // Call the logout method
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    ); // Navigate to LoginScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: appbarheight,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        title: const Center(
            child: Text('Filter      ', style: TextStyle(fontSize: 20))),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: ListView(children: [
        const CustomListTile(
            title: 'Profile',
            icon: Icons.manage_accounts,
            screen: EditProfileScreen()),
        const CustomListTile(
            title: 'Favorites',
            icon: Icons.favorite_rounded,
            screen: FavoriteListScreen()),
        const CustomListTile(
            title: 'Saved',
            icon: Icons.bookmark,
            screen: SavedCategoriesScreen()),
        const CustomListTile(
            title: 'Requests',
            icon: Icons.list_alt_rounded,
            screen: ApartmentRequestsScreen()),
        const CustomListTile(
            title: 'Settings',
            icon: Icons.settings,
            screen: ApartmentRequestsScreen()),
        SizedBox(height: MediaQuery.of(context).size.height * 0.26),
        Center(
            child: ColoredButton(
                color: mainColor,
                text: 'Log Out',
                onPressed: () => logout(context))),
      ]),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget screen;
  const CustomListTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.screen});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          leading: Container(
              width: 42,
              height: 42,
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, -2)),
                ],
              ),
              child: Icon(icon, size: 30, color: contrastColor)),
          trailing:
              const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
          onTap: () => Navigator.push(
              (context), MaterialPageRoute(builder: (context) => screen)),
        ));
  }
}
