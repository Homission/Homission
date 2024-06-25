import 'package:flutter/material.dart';

// class Gifticon {
//   final String image;
//   final bool wish;
//   final String name;
//   final int point;
//   final String contributorName;
//   final String contributorDescription;
//
//   Gifticon({
//     required this.image,
//     required this.wish,
//     required this.name,
//     required this.point,
//     required this.contributorName,
//     required this.contributorDescription,
//   });
//
//   factory Gifticon.fromJson(Map<String, dynamic> json) {
//     return Gifticon(
//       image: json['image'] as String,
//       wish: json['wish'] as bool,
//       name: json['name'] as String,
//       point: json['point'] as int,
//       contributorName: json['contributorName'] as String,
//       contributorDescription: json['contributorDescription'] as String,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'image': image,
//       'wish': wish,
//       'name': name,
//       'point': point,
//       'contributorName': contributorName,
//       'contributorDescription': contributorDescription,
//     };
//   }
// }

class Gifticon {
  String donorNickname;
  String expiryDate;
  String gifticonName;
  String id;
  String imageUrl;
  String letter;
  int price;

  Gifticon({
    required this.donorNickname,
    required this.expiryDate,
    required this.gifticonName,
    required this.id,
    required this.imageUrl,
    required this.letter,
    required this.price,
  });

  factory Gifticon.fromJson(Map<String, dynamic> json) {
    return Gifticon(
      donorNickname: json['donor_nickname'],
      expiryDate: json['expiry_date'],
      gifticonName: json['gifticon_name'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      letter: json['letter'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'donor_nickname': donorNickname,
      'expiry_date': expiryDate,
      'gifticon_name': gifticonName,
      'id': id,
      'imageUrl': imageUrl,
      'letter': letter,
      'price': price,
    };
  }
}
