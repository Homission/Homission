import 'package:firebase_database/firebase_database.dart';
import 'package:homission/Presentation/Mission/Model/Mission.dart';
import 'package:homission/Presentation/Mission/Model/UserMission.dart';
import 'package:homission/Presentation/Mission/Repository/mission_repository.dart';

class FirebaseMissionRepository implements MissionRepository {
  final DatabaseReference _missionsRef =
      FirebaseDatabase.instance.ref('Mission');
  final DatabaseReference _userMissionsRef =
      FirebaseDatabase.instance.ref('UserMission');

  @override
  Future<List<Mission>> fetchMissions() async {
    DataSnapshot snapshot = await _missionsRef.get();
    List<Mission> missions = [];
    if (snapshot.exists) {
      final values = snapshot.value as List<dynamic>;
      for (var value in values) {
        if (value != null) {
          missions.add(Mission.fromMap(value as Map<dynamic, dynamic>));
        }
      }
    }
    return missions;
  }

  @override
  Future<UserMission> fetchUserMission(String userId) async {
    DataSnapshot snapshot = await _userMissionsRef.child(userId).get();
    if (snapshot.exists) {
      return UserMission.fromMap(snapshot.value as Map<dynamic, dynamic>);
    } else {
      throw Exception("User mission data not found");
    }
  }
}
