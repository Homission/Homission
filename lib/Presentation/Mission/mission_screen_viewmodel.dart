import 'package:flutter/material.dart';
import 'package:homission/Presentation/Mission/InProgressMission/in_progress_screen_viewmodel.dart';
import 'CompletedMission/completed_screen_viewmodel.dart';
import 'BrowseMission/browse_screen_viewmodel.dart';
import 'package:homission/Presentation/Mission/Model/Mission.dart';
import 'package:homission/Presentation/Mission/Model/UserMission.dart';

class MissionScreenViewModel extends ChangeNotifier {
  List<Mission> allMissions = [
    Mission(
      missionID: 1,
      title: '미션 1',
      rewardPoints: 100,
      description: '이것은 미션 1에 대한 설명입니다.',
      participants: '1,201명',
      category: '구직',
      missionImage: 'path_to_image_1',
    ),
    Mission(
      missionID: 2,
      title: '미션 2',
      rewardPoints: 200,
      description: '이것은 미션 2에 대한 설명입니다.',
      participants: '2,345명',
      category: '건강',
      missionImage: 'path_to_image_2',
    ),
    Mission(
      missionID: 3,
      title: '미션 3',
      rewardPoints: 300,
      description: '이것은 미션 3에 대한 설명입니다.',
      participants: '567명',
      category: '교육',
      missionImage: 'path_to_image_3',
    ),
    Mission(
      missionID: 4,
      title: '미션 4',
      rewardPoints: 400,
      description: '이것은 미션 4에 대한 설명입니다.',
      participants: '3,789명',
      category: '마음',
      missionImage: 'path_to_image_4',
    ),
    Mission(
      missionID: 5,
      title: '미션 5',
      rewardPoints: 500,
      description: '이것은 미션 5에 대한 설명입니다.',
      participants: '1,234명',
      category: '건강',
      missionImage: 'path_to_image_5',
    ),
    Mission(
      missionID: 6,
      title: '완료된 미션 1',
      rewardPoints: 100,
      description: '이것은 완료된 미션 1에 대한 설명입니다.',
      participants: '1,201명',
      category: '건강',
      missionImage: 'path_to_image_1',
    ),
    Mission(
      missionID: 7,
      title: '완료된 미션 2',
      rewardPoints: 200,
      description: '이것은 완료된 미션 2에 대한 설명입니다.',
      participants: '2,345명',
      category: '구직',
      missionImage: 'path_to_image_2',
    ),
    Mission(
      missionID: 8,
      title: '완료된 미션 3',
      rewardPoints: 300,
      description: '이것은 완료된 미션 3에 대한 설명입니다.',
      participants: '567명',
      category: '교육',
      missionImage: 'path_to_image_3',
    ),
    Mission(
      missionID: 9,
      title: '완료된 미션 4',
      rewardPoints: 400,
      description: '이것은 완료된 미션 4에 대한 설명입니다.',
      participants: '3,789명',
      category: '마음',
      missionImage: 'path_to_image_4',
    ),
    Mission(
      missionID: 10,
      title: '완료된 미션 5',
      rewardPoints: 500,
      description: '이것은 완료된 미션 5에 대한 설명입니다.',
      participants: '1,234명',
      category: '건강',
      missionImage: 'path_to_image_5',
    ),
  ];
  UserMission userMission = UserMission(
      onGoingMission: [1, 2, 3, 4, 5], completedMission: [6, 7, 8, 9, 10]);

  final InProgressScreenViewModel inProgressViewModel;
  final CompletedScreenViewModel completedViewModel;
  final BrowseScreenViewModel browseViewModel;

  MissionScreenViewModel({
    required this.inProgressViewModel,
    required this.completedViewModel,
    required this.browseViewModel,
  });

  Future<void> fetchAllData() async {
    // Assign missions to each viewmodel
    inProgressViewModel.missions = allMissions
        .where(
            (mission) => userMission.onGoingMission.contains(mission.missionID))
        .toList();
    completedViewModel.missions = allMissions
        .where((mission) =>
            userMission.completedMission.contains(mission.missionID))
        .toList();
    browseViewModel.missions = allMissions;

    // Notify listeners
    notifyListeners();
    inProgressViewModel.notifyListeners();
    completedViewModel.notifyListeners();
    browseViewModel.notifyListeners();
  }

  Future<List<Mission>> fetchMissionsFromDatabase() async {
    // Your code to fetch missions from the database
    // Example:
    return Future.delayed(
      const Duration(seconds: 2),
      () => [
        Mission(
          missionID: 1,
          title: 'Mission 1',
          rewardPoints: 100,
          description: 'Description of mission 1',
          participants: '1,201명',
          category: '구직',
          missionImage: 'path_to_image_1',
        ),
        // Add more missions
      ],
    );
  }

  Future<UserMission> fetchUserMissionFromDatabase() async {
    // Your code to fetch user missions from the database
    // Example:
    return Future.delayed(
      const Duration(seconds: 2),
      () => UserMission(
        onGoingMission: [1],
        completedMission: [2, 3],
      ),
    );
  }
}
