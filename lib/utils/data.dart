import 'package:doorstep_vujade/models/apartment.dart';
import 'package:flutter/material.dart';
// import '../models/amenity.dart';
import '../models/property.dart';
import '../utils/colors.dart';

TextStyle boldBigBlackTextStyle = const TextStyle(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30);
TextStyle boldMediumBlackTextStyle = const TextStyle(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15);
TextStyle mediumBlackTextStyle =
    const TextStyle(color: Colors.black, fontSize: 15);
TextStyle smallBlackTextStyle =
    const TextStyle(color: Colors.black, fontSize: 12);

TextStyle boldBigColoredTextStyle =
    TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: 30);
TextStyle boldMediumColoredTextStyle =
    TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: 15);
TextStyle boldSmallColoredTextStyle =
    TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: 12);
TextStyle smallColoredTextStyle = TextStyle(color: mainColor, fontSize: 12);

Apartment apartment = Apartment(
    id: '1',
    name: 'Al Rayyan',
    location: 'Riyadh',
    bedrooms: 4,
    price: 5000,
    imageUrl: 'assets/images/buildings.jpeg',
    category: 'Families',
    coverage: '5G',
    lounge: 2,
    space: '120 mm2',
    toilets: 3,
    description:
        'Luxury apartment in Al-Yasmeen neighborhood in Khawalid 9 project, overlooking the garden');

List<Property> properties = [
  Property(
    agentId: 1,
    userId: 101,
    title: 'Luxurious Beachfront Condo',
    description:
        'Experience the beauty of the ocean with this stunning beachfront condo. Perfect for relaxation and entertainment.',
    price: '450000.00',
    location: 'Miami Beach, FL',
    bedrooms: 3,
    bathrooms: 2,
    area: 1500.0,
    propertyType: 'Condo',
    status: 'Available',
    viewCount: 120,
    // amenities: [
    //   Amenity(
    //       id: 1,
    //       name: 'Swimming Pool',
    //       icon: 'pool.png',
    //       category: 'Recreation',
    //       address: '123 Beach Rd',
    //       latitude: 25.7617,
    //       longitude: -80.1918),
    //   Amenity(
    //       id: 2,
    //       name: 'Gym',
    //       icon: 'gym.png',
    //       category: 'Fitness',
    //       address: '123 Beach Rd',
    //       latitude: 25.7617,
    //       longitude: -80.1918),
    // ],
  ),
  Property(
    agentId: 2,
    userId: 102,
    title: 'Cozy Mountain Cabin',
    description:
        'A cozy cabin in the mountains with breathtaking views and a rustic charm. Perfect for winter getaways!',
    price: '350000.00',
    location: 'Aspen, CO',
    bedrooms: 2,
    bathrooms: 1,
    area: 800.0,
    propertyType: 'Cabin',
    status: 'Sold',
    viewCount: 75,
    // amenities: [
    //   Amenity(
    //       id: 3,
    //       name: 'Fireplace',
    //       icon: 'fireplace.png',
    //       category: 'Interior',
    //       address: '456 Mountain Rd',
    //       latitude: 39.1911,
    //       longitude: -106.8175),
    //   Amenity(
    //       id: 4,
    //       name: 'Hot Tub',
    //       icon: 'hot_tub.png',
    //       category: 'Recreation',
    //       address: '456 Mountain Rd',
    //       latitude: 39.1911,
    //       longitude: -106.8175),
    // ],
  ),
  Property(
    agentId: 3,
    userId: 103,
    title: 'Modern City Apartment',
    description:
        'A modern apartment in the heart of the city, close to all amenities and public transport.',
    price: '500000.00',
    location: 'New York City, NY',
    bedrooms: 1,
    bathrooms: 1,
    area: 600.0,
    propertyType: 'Apartment',
    status: 'Available',
    viewCount: 200,
    // amenities: [
    //   Amenity(
    //       id: 5,
    //       name: 'Rooftop Terrace',
    //       icon: 'rooftop.png',
    //       category: 'Recreation',
    //       address: '789 City St',
    //       latitude: 40.7128,
    //       longitude: -74.0060),
    //   Amenity(
    //       id: 6,
    //       name: 'Laundry Room',
    //       icon: 'laundry.png',
    //       category: 'Utility',
    //       address: '789 City St',
    //       latitude: 40.7128,
    //       longitude: -74.0060),
    // ],
  ),
];
