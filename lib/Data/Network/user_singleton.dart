import 'user_model.dart';

class UserSingleton {
  static final UserSingleton _instance = UserSingleton._internal();

  User? _user;

  factory UserSingleton() {
    return _instance;
  }

  UserSingleton._internal();

  User? get user => _user;

  void setUser(User user) {
    _user = user;
  }

  void clearUser() {
    _user = null;
  }
}
