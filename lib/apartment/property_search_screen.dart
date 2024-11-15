import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global_widgets/apartment_item.dart';
import '../services/search.dart';

class PropertySearchScreen extends StatefulWidget {
  const PropertySearchScreen({super.key});

  @override
  State<PropertySearchScreen> createState() => _PropertySearchScreenState();
}

class _PropertySearchScreenState extends State<PropertySearchScreen> {
  List<dynamic>? properties;
  String? token; // Variable to hold the token
  final double maxPrice = 500000; // Set your max price filter

  @override
  void initState() {
    super.initState();
    fetchTokenAndProperties();
  }

  Future<void> fetchTokenAndProperties() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    if (token != null) {
      ApiService apiService = ApiService();

      try {
        // Fetch properties
        properties = await apiService.searchProperties(token!, filters: {
          'price_max': maxPrice.toString(),
        });

        print(properties); // Debugging line
        setState(() {});
      } catch (e) {
        print('Error fetching properties: $e');
      }
    } else {
      print('User is not logged in.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Properties')),
      body: properties == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: properties!.map<Widget>((property) {
                  return ApartmentItem(
                    isWide: true,
                    property: property, // Pass property data
                  );
                }).toList(),
              ),
            ),
    );
  }
}
