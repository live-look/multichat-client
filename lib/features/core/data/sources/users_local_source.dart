import 'package:hive/hive.dart';
import '../../entities/user.dart';

class UsersLocalSource {
  static const String boxName = "users";
  static const String currentUserKey = "current_user";

  Box<User>? _usersBox;
  Box<User> get _box {
    _usersBox ??= Hive.box<User>(boxName);
    return _usersBox!;
  }

  void putCurrentUser(User user) {
    _box.put(currentUserKey, user);
  }

  User? getCurrentUser() {
    return _box.get(currentUserKey);
  }
}
