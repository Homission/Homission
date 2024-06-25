import 'package:flutter/material.dart';

class Mission {
  final int missionID;
  final String title;
  final int rewardPoints;
  final String description;
  final String participants;
  final String category;
  final String missionImage;

  Mission({
    required this.missionID,
    required this.title,
    required this.rewardPoints,
    required this.description,
    required this.participants,
    required this.category,
    required this.missionImage,
  });

  factory Mission.fromMap(Map<dynamic, dynamic> map) {
    return Mission(
      missionID: map['missionID'],
      title: map['title'],
      rewardPoints: map['rewardPoints'],
      description: map['description'],
      participants: map['participants'],
      category: map['category'],
      missionImage: map['missionImage'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'missionID': missionID,
      'title': title,
      'rewardPoints': rewardPoints,
      'description': description,
      'participants': participants,
      'category': category,
      'missionImage': missionImage,
    };
  }
}
