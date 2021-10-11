import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:multichat/features/core/data/sources/users_local_source.dart';
import '../sources/users_remote_source.dart';
import '../../entities/user.dart' as project;

import '../../../../src/generated/users.pb.dart' as pb;

class AuthRepository {
  final FirebaseAuth _firebaseAuthInstance;
  final UsersRemoteSource _usersRemoteSource;
  final UsersLocalSource _usersLocalSource;

  AuthRepository({
    FirebaseAuth? firebaseAuthInstance,
    UsersRemoteSource? usersRemoteSource,
    UsersLocalSource? usersLocalSource,
  })  : _firebaseAuthInstance = firebaseAuthInstance ?? GetIt.I<FirebaseAuth>(),
        _usersRemoteSource = usersRemoteSource ?? GetIt.I<UsersRemoteSource>(),
        _usersLocalSource = usersLocalSource ?? GetIt.I<UsersLocalSource>();

  Future<project.User> signUp(project.User userInfo) async {
    final userCredential = await _firebaseAuthInstance.signInAnonymously();
    final fbUser = userCredential.user;
    if (fbUser == null) {
      throw Exception("signInAnonymously failed");
    }

    pb.User pbUser = pb.User(
      uid: fbUser.uid,
      name: userInfo.name,
      gender: userInfo.gender,
      age: userInfo.age,
    );
    final client = _usersRemoteSource.client;

    pbUser = await client.create(pbUser);

    final currentUser = userInfo.copyWith(
      uid: fbUser.uid,
      id: pbUser.id,
    );

    _usersLocalSource.putCurrentUser(currentUser);

    return currentUser;
  }

  Future<project.User?> signIn() async {
    User? fbUser = _firebaseAuthInstance.currentUser;
    if (fbUser == null) {
      return null;
    }

    return _usersLocalSource.getCurrentUser(fbUser.uid);
  }

  Future<void> signOut() async {
    await _firebaseAuthInstance.signOut();
  }
}
