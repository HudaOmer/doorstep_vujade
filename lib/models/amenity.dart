class Amenity {
  final int id;
  final String name;
  final String? icon;
  final String? category;
  final String? address;
  final double? latitude;
  final double? longitude;

  Amenity({
    required this.id,
    required this.name,
    this.icon,
    this.category,
    this.address,
    this.latitude,
    this.longitude,
  });

  // Convert JSON to Amenity instance
  factory Amenity.fromJson(Map<String, dynamic> json) {
    return Amenity(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      category: json['category'],
      address: json['address'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
    );
  }

  // Convert Amenity instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'category': category,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
// class Amenity {
//   final int id;
//   final String name;
//   final String icon;
//   final String category; // default: 'school'
//   final String? address; // nullable
//   final double latitude;  // Geographical coordinates
//   final double longitude; // Geographical coordinates

//   Amenity({
//     required this.id,
//     required this.name,
//     required this.icon,
//     required this.category,
//     this.address,
//     required this.latitude,
//     required this.longitude,
//   });

//   factory Amenity.fromJson(Map<String, dynamic> json) {
//     return Amenity(
//       id: json['id'],
//       name: json['name'],
//       icon: json['icon'],
//       category: json['category'],
//       address: json['address'], // This can be null
//       latitude: json['latitude'].toDouble(),  // Ensure it's a double
//       longitude: json['longitude'].toDouble(), // Ensure it's a double
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'icon': icon,
//       'category': category,
//       'address': address,
//       'latitude': latitude,
//       'longitude': longitude,
//     };
//   }
// }
