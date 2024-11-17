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
