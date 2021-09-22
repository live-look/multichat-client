import 'package:hive/hive.dart';
import '../../entities/user.dart';

class UsersLocalSource {
  static const String _boxName = "users";

  Box<User>? _currentUserBox;
  Future<void> initSource() async {
    _currentUserBox ??= await Hive.openBox<User>(_boxName);
  }

  void putCurrentUser(User user) {
    _currentUserBox?.put(user.id, user);
  }

  User? getCurrentUser(String id) {
    _currentUserBox?.get(id);
  }
}
