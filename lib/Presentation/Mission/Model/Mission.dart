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
}
