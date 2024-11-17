import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../global_widgets/apartment_item.dart';
import '../../services/search.dart';

class ItemsSlider extends StatefulWidget {
  final double maxPrice;
  final bool isWide;
  const ItemsSlider({super.key, required this.maxPrice, required this.isWide});

  @override
  State<ItemsSlider> createState() => _PropertySearchScreenState();
}

class _PropertySearchScreenState extends State<ItemsSlider> {
  List<dynamic>? properties;
  String? token; // Variable to hold the token

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
          'price_max': widget.maxPrice.toString(),
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
    return SizedBox(
      height: 255,
      child: properties == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: properties!.map<Widget>((property) {
                  return ApartmentItem(
                    isWide: widget.isWide,
                    property: property, // Pass property data
                  );
                }).toList(),
              ),
            ),
    );
  }
}
