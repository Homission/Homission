class User {
  final String email;
  final String centerName;
  final String nickName;
  final int point;
  final bool isAdmin;

  User({
    required this.email,
    required this.centerName,
    required this.nickName,
    required this.point,
    required this.isAdmin,
  });

  factory User.fromMap(String email, Map<String, dynamic> map) {
    return User(
      email: email.replaceAll('+', '.'),
      centerName: map['centerName'] ?? '',
      nickName: map['nickName'] ?? '호미니',
      point: map['point'] ?? 0,
      isAdmin: map['isAdmin'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'centerName': centerName,
      'nickName': nickName,
      'point': point,
      'isAdmin': isAdmin,
    };
  }
}
