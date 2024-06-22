import 'package:firebase_database/firebase_database.dart';
import 'package:homission/Presentation/Mission/Model/Mission.dart';
import 'package:homission/Presentation/Mission/Model/UserMission.dart';


abstract class MissionRepository {
  Future<List<Mission>> fetchMissions();
  Future<UserMission> fetchUserMission(String userId);
}
