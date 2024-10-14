class Apartment {
  final String id;
  final String name;
  final String location;
  final int bedrooms;
  final int lounge;
  final int toilets;
  final String space;
  final String coverage;
  final String category;
  final double price;
  final String imageUrl;
  final String description;

  Apartment({
    required this.id,
    required this.name,
    required this.location,
    required this.bedrooms,
    required this.price,
    required this.imageUrl,
    required this.lounge,
    required this.toilets,
    required this.space,
    required this.coverage,
    required this.category,
    required this.description,
  });
}
