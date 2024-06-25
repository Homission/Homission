class UserMission {
  final List<int> onGoingMission;
  final List<int> completedMission;

  UserMission({
    required this.onGoingMission,
    required this.completedMission,
  });

  factory UserMission.fromMap(Map<dynamic, dynamic> map) {
    return UserMission(
      onGoingMission: List<int>.from(map['onGoingMission']),
      completedMission: List<int>.from(map['completedMission']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'onGoingMission': onGoingMission,
      'completedMission': completedMission,
    };
  }
}


