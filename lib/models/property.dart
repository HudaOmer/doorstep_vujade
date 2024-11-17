// import 'amenity.dart';

class Property {
  final int? id;
  final int? agentId;
  final int? userId;
  final String title;
  final String description;
  final String price;
  final String location;
  final int bedrooms;
  final int bathrooms;
  final double area;
  final String propertyType;
  final String status;
  final int viewCount;
  final String? deletedAt;
  // final List<Amenity> amenities;

  Property({
    this.id,
    this.agentId,
    this.userId,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.propertyType,
    required this.status,
    required this.viewCount,
    this.deletedAt,
    // required this.amenities,
  });

  // Convert JSON to Property instance
  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      agentId: json['agent_id'],
      userId: json['user_id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      location: json['location'],
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      area: json['area'].toDouble(),
      propertyType: json['property_type'],
      status: json['status'],
      viewCount: json['view_count'],
      deletedAt: json['deleted_at'],
      // amenities: (json['amenities'] as List<dynamic>)
      //     .map((amenity) => Amenity.fromJson(amenity))
      //     .toList(),
    );
  }

  // Convert Property instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'agent_id': agentId,
      'user_id': userId,
      'title': title,
      'description': description,
      'price': price,
      'location': location,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area': area,
      'property_type': propertyType,
      'status': status,
      'view_count': viewCount,

      // 'amenities': amenities.map((amenity) => amenity.toJson()).toList(),
    };
  }
}
