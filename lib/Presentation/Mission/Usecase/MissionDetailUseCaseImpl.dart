import 'package:homission/Presentation/Mission/Repository/mission_repository.dart';
import 'package:homission/Presentation/Mission/DetailMission/detail_screen_viewmodel.dart';
import 'package:homission/Presentation/Mission/Usecase/MissionDetailUseCase.dart';


class MissionDetailUseCaseImpl implements MissionDetailUseCase {
  final MissionRepository missionRepository;

  MissionDetailUseCaseImpl(this.missionRepository);

  @override
  Future<MissionDetailViewModel> getMissionDetails(
      String userId, int missionId) async {
    final missions = await missionRepository.fetchMissions();
    final userMission = await missionRepository.fetchUserMission(userId);
    final participationRate =
        await missionRepository.fetchUserParticipationRate(userId, missionId);

    final mission = missions.firstWhere((m) => m.missionID == missionId);
    final isParticipating = userMission.onGoingMission.contains(missionId);
    final isCompleted = userMission.completedMission.contains(missionId);

    final missionStatus = isCompleted
        ? MissionStatus.completed
        : isParticipating
            ? MissionStatus.inProgress
            : MissionStatus.notStarted;

    return MissionDetailViewModel()
      ..setMissionDetails(
        title: mission.title,
        description: mission.description,
        category: mission.category,
        rewardPoints: mission.rewardPoints,
        participantsCount:
            int.parse(mission.participants.replaceAll(RegExp(r'[^0-9]'), '')),
        completionRate: participationRate,
        missionStatus: missionStatus,
      );
  }
}

