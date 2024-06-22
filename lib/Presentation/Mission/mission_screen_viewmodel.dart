import 'package:flutter/material.dart';
import 'package:homission/Presentation/Mission/InProgressMission/in_progress_screen_viewmodel.dart';
import 'CompletedMission/completed_screen_viewmodel.dart';
import 'BrowseMission/browse_screen_viewmodel.dart';
import 'package:homission/Presentation/Mission/Model/Mission.dart';
import 'package:homission/Presentation/Mission/Model/UserMission.dart';
import 'package:homission/Presentation/Mission/Repository/mission_repository.dart';

class MissionScreenViewModel extends ChangeNotifier {
  List<Mission> allMissions = [];
  UserMission userMission =
      UserMission(onGoingMission: [], completedMission: []);

  final InProgressScreenViewModel inProgressViewModel;
  final CompletedScreenViewModel completedViewModel;
  final BrowseScreenViewModel browseViewModel;
  final MissionRepository missionRepository;

  MissionScreenViewModel({
    required this.inProgressViewModel,
    required this.completedViewModel,
    required this.browseViewModel,
    required this.missionRepository,
  });

  Future<void> fetchAllData(String userId) async {
    allMissions = await missionRepository.fetchMissions();
    userMission = await missionRepository.fetchUserMission(userId);

    inProgressViewModel.missions = allMissions
        .where(
            (mission) => userMission.onGoingMission.contains(mission.missionID))
        .toList();
    completedViewModel.missions = allMissions
        .where((mission) =>
            userMission.completedMission.contains(mission.missionID))
        .toList();
    browseViewModel.missions = allMissions;

    notifyListeners();
    inProgressViewModel.notifyListeners();
    completedViewModel.notifyListeners();
    browseViewModel.notifyListeners();
  }
}
