import 'package:homission/Presentation/Mission/DetailMission/detail_screen_viewmodel.dart';

abstract class MissionDetailUseCase {
  Future<MissionDetailViewModel> getMissionDetails(
      String userId, int missionId);
}
