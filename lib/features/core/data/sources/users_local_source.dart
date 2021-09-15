import 'package:hive/hive.dart';
import '../../entities/current_user.dart';

class UsersLocalSource {
  static const String _boxName = "users";

  Box<CurrentUser>? _currentUserBox;
  Future<void> initSource() async {
    _currentUserBox ??= await Hive.openBox<CurrentUser>(_boxName);
  }

  void putCurrentUser(CurrentUser user) {
    _currentUserBox?.put(user.id, user);
  }

  CurrentUser? getCurrentUser(String id) {
    _currentUserBox?.get(id);
  }
}