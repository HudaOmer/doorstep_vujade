import 'dart:convert';
import 'package:http/http.dart' as http;

class NearbyPropertiesService {
  // API endpoint to fetch nearby properties
  static const String _baseUrl =
      'http://192.168.100.87:8000/api/properties/nearby';

  // Fetch properties based on latitude and longitude
  Future<List<PropertyLocation>> fetchNearbyProperties(
      double latitude, double longitude) async {
    final String url = '$_baseUrl/$latitude/$longitude';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> properties = data['properties'];

        return properties.map<PropertyLocation>((property) {
          return PropertyLocation(
            id: property['id'],
            name: property['name'] ?? 'No Name',
            description: property['description'] ?? 'No Description',
            latitude: property['latitude'],
            longitude: property['longitude'],
          );
        }).toList();
      } else {
        throw Exception('Failed to load nearby properties');
      }
    } catch (e) {
      throw Exception('Error fetching nearby properties: $e');
    }
  }
}

class PropertyLocation {
  final int id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;

  PropertyLocation({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
  });
}
