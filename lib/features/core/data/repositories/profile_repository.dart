import 'package:get_it/get_it.dart';

import '../sources/users_local_source.dart';
import '../sources/users_remote_source.dart';

import '../../entities/user.dart' as project;
import '../../../../src/generated/users.pb.dart' as pb;

class ProfileRepository {
  final UsersLocalSource _usersLocalSource;
  final UsersRemoteSource _usersRemoteSource;

  ProfileRepository({
    UsersLocalSource? usersLocalSource,
    UsersRemoteSource? usersRemoteSource,
  })  : _usersLocalSource = usersLocalSource ?? GetIt.I<UsersLocalSource>(),
        _usersRemoteSource = usersRemoteSource ?? GetIt.I<UsersRemoteSource>();

  project.User? getCurrentUserProfile() {
    return _usersLocalSource.getCurrentUser();
  }

  Future<void> updateCurrentUserProfile(project.User user) async {
    final pb.User pbUser = pb.User(
      id: user.id,
      uid: user.uid,
      name: user.name,
      gender: user.gender,
      age: user.age,
    );
    final client = _usersRemoteSource.client;

    await client.update(pbUser);

    _usersLocalSource.putCurrentUser(user);
  }
}
