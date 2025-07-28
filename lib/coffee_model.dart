import 'package:google_maps_flutter/google_maps_flutter.dart';

class Coffee {
  String shopName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Coffee({
    required this.shopName,
    required this.address,
    required this.description,
    required this.thumbNail,
    required this.locationCoords,
  });
}

final List<Coffee> coffeeShops = [
  Coffee(
    shopName: 'Imperfecto',
    address: '1-A/1, Hauz Khas Village, New Delhi',
    description:
        'Rooftop cafe with eclectic decor, serving Mediterranean, Italian, and North Indian cuisines.',
    locationCoords: LatLng(28.5741, 77.2145), // Hauz Khas Village
    thumbNail:
        'https://lh5.googleusercontent.com/p/AF1QipN1Z7aKet5353lu0Aah0a=w90-h90-n-k-no',
  ),
  Coffee(
    shopName: 'The Brew Room',
    address: 'Anand Lok Shopping Centre, Opposite Gargi College, New Delhi',
    description:
        'Specializes in eight coffee brewing methods, offering continental cuisine and desserts.',
    locationCoords: LatLng(28.5618, 77.2357), // Anand Lok
    thumbNail:
        'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBxNeEVR1hWQCvR=w90-h90-n-k-no',
  ),
  Coffee(
    shopName: 'Social',
    address: '9-A & 12, Hauz Khas Village, New Delhi',
    description:
        'Vibrant cafe with live music, serving continental, American, and North Indian dishes.',
    locationCoords: LatLng(28.6043, 77.1048), // Hauz Khas Village
    thumbNail:
        'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no',
  ),
  Coffee(
    shopName: 'Kunzum Travel Café',
    address: 'T-49, First Floor, Hauz Khas Village, New Delhi',
    description:
        'Pocket-friendly cafe with a "Pay What You Like" policy, featuring travel-themed decor.',
    locationCoords: LatLng(28.5340, 77.1747), // Hauz Khas Village
    thumbNail:
        'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no',
  ),
  Coffee(
    shopName: 'Cinnabon',
    address: 'GFK 4A, Ground Floor, DLF Place Mall, Saket, New Delhi',
    description:
        'Bakery cafe known for cinnamon rolls, coffee, and frozen drinks.',
    locationCoords: LatLng(28.5286, 77.2167), // Saket
    thumbNail:
        'https://lh5.googleusercontent.com/p/AF1QipOMNvnrTlesBJwUcVVFBqVF-KnMVlJMi7_uU6lZ=w90-h90-n-k-no',
  ),
];
