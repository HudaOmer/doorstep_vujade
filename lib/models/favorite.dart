import 'property.dart';

class Favorite {
  final int userId;
  final int propertyId;
  final Property property; // Add property field

  Favorite({
    required this.userId,
    required this.propertyId,
    required this.property, // Update constructor
  });

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      userId: json['user_id'],
      propertyId: json['property_id'],
      property: Property.fromJson(json['property']), // Parse property from JSON
    );
  }
}
