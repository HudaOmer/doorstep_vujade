import 'package:doorstep_vujade/models/apartment.dart';
import 'package:flutter/material.dart';
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
