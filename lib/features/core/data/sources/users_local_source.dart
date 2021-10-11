import 'package:hive/hive.dart';
import '../../entities/user.dart';

class UsersLocalSource {
  static const String boxName = "users";

  Box<User>? _usersBox;
  Box<User> get _box {
    _usersBox ??= Hive.box<User>(boxName);
    return _usersBox!;
  }

  void putCurrentUser(User user) {
    _box.put(user.uid, user);
  }

  User? getCurrentUser(String uid) {
    return _box.get(uid);
  }
}
