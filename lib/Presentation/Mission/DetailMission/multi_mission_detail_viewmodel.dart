import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
//import 'mission_status.dart'; // Import the shared enum
import 'package:flutter/foundation.dart';


class MissionStep {
  final String description;
  final int rewardPoints;

  MissionStep({
    required this.description,
    required this.rewardPoints,
  });
}
enum MissionStatus { notStarted, inProgress, completed }

class MultiMissionDetailViewModel extends ChangeNotifier {
  bool _isParticipating = false;
  double _completionRate = 0.0;
  MissionStatus _missionStatus = MissionStatus.notStarted;
  String _title = '';
  String _description = '';
  String _category = '';
  int _rewardPoints = 0;
  int _participantsCount = 0;
  List<MissionStep> _steps = [];

  bool get isParticipating => _isParticipating;
  double get completionRate => _completionRate;
  MissionStatus get missionStatus => _missionStatus;
  String get title => _title;
  String get description => _description;
  String get category => _category;
  int get rewardPoints => _rewardPoints;
  int get participantsCount => _participantsCount;
  List<MissionStep> get steps => _steps;

  void toggleParticipation() {
    _isParticipating = !_isParticipating;
    _missionStatus =
        _isParticipating ? MissionStatus.inProgress : MissionStatus.notStarted;
    notifyListeners();
  }

  void setMissionDetails({
    required String title,
    required String description,
    required String category,
    required int rewardPoints,
    required int participantsCount,
    required double completionRate,
    required MissionStatus missionStatus,
    required List<MissionStep> steps,
  }) {
    _title = title;
    _description = description;
    _category = category;
    _rewardPoints = rewardPoints;
    _participantsCount = participantsCount;
    _completionRate = completionRate;
    _missionStatus = missionStatus;
    _steps = steps;
    notifyListeners();
  }

  void updateCompletionRate(double newRate) {
    _completionRate = newRate;
    if (_completionRate >= 1.0) {
      _missionStatus = MissionStatus.completed;
    }
    notifyListeners();
  }
}
