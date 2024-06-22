class UserMission {
  final List<int> onGoingMission;
  final List<int> completedMission;

  UserMission({
    required this.onGoingMission,
    required this.completedMission,
  });

  // You can add methods or factory constructors if needed
  factory UserMission.fromJson(Map<String, dynamic> json) {
    return UserMission(
      onGoingMission: List<int>.from(json['onGoingMission']),
      completedMission: List<int>.from(json['completedMission']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'onGoingMission': onGoingMission,
      'completedMission': completedMission,
    };
  }
}
