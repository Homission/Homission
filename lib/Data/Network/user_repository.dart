import 'package:firebase_database/firebase_database.dart';
import 'package:homission/data/Network/user_model.dart';
import 'package:homission/data/Network/user_singleton.dart';

class UserRepository {
  final DatabaseReference _database = FirebaseDatabase.instance.ref().child('User');

  Future<User?> getUser(String email) async {
    final emailKey = email.replaceAll('.', '+');
    final snapshot = await _database.child(emailKey).once();
    if (snapshot.snapshot.value != null) {
      final data = Map<String, dynamic>.from(snapshot.snapshot.value as Map);
      return User.fromMap(emailKey, data);
    }
    return null;
  }

  Future<void> createUser(User user) async {
    final emailKey = user.email.replaceAll('.', '+');
    await _database.child(emailKey).set(user.toMap());
  }

  Future<void> updateUser(User user) async {
    final emailKey = user.email.replaceAll('.', '+');
    await _database.child(emailKey).update(user.toMap());
  }

  Future<void> deleteUser(String email) async {
    final emailKey = email.replaceAll('.', '+');
    await _database.child(emailKey).remove();
  }

  void saveUserToSingleton(User user) {
    UserSingleton().setUser(user);
  }

  User? getUserFromSingleton() {
    return UserSingleton().user;
  }

  void clearUserFromSingleton() {
    UserSingleton().clearUser();
  }
}
