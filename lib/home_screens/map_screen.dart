import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';
import '../global_widgets/apartment_item.dart';
import '../services/nearby_properties.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Set<Marker> _markers = {};
  bool _isLoading = true;

  // The NearbyPropertiesService instance
  final NearbyPropertiesService _nearbyPropertiesService =
      NearbyPropertiesService();

  @override
  void initState() {
    super.initState();
    _fetchNearbyProperties();
  }

  // Function to fetch nearby properties and set markers on the map
  Future<void> _fetchNearbyProperties() async {
    try {
      // Fetch nearby properties using the service (You can change lat/lon)
      List<PropertyLocation> properties =
          await _nearbyPropertiesService.fetchNearbyProperties(25.331, 55.272);

      setState(() {
        // Create markers based on the properties
        _markers = properties.map<Marker>((property) {
          return Marker(
            markerId: MarkerId(property.id.toString()),
            position: LatLng(property.latitude, property.longitude),
            infoWindow: InfoWindow(
              title: property.name,
              snippet: property.description,
            ),
          );
        }).toSet();
        _isLoading = false; // Stop loading once data is fetched
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (kDebugMode) {
        print('Error: $e');
      }
      // Handle error (maybe show a toast or alert)
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Properties'),
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // Check if data is loading
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else
            GoogleMap(
              onMapCreated: _onMapCreated,
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(25.331, 55.272),
                zoom: 11.0,
              ),
              markers: _markers, // Display the markers on the map
            ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: HorizantalApatrmentItem(),
          ),
        ],
      ),
    );
  }
}
