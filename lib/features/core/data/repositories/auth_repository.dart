import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import '../sources/users_api_source.dart';
import '../../entities/current_user.dart';
import '../../entities/user_photo.dart';

import '../../../../src/generated/users.pb.dart' as pb;

class AuthRepository {
  final FirebaseAuth _firebaseAuthInstance;
  final UsersApiSource _usersApiSource;

  AuthRepository({
    FirebaseAuth? firebaseAuthInstance,
    UsersApiSource? usersApiSource,
  })  : _firebaseAuthInstance = firebaseAuthInstance ?? GetIt.I<FirebaseAuth>(),
        _usersApiSource = usersApiSource ?? GetIt.I<UsersApiSource>();

  Future<CurrentUser> signIn() async {
    User? fbUser = _firebaseAuthInstance.currentUser;
    if (fbUser == null) {
      UserCredential userCredential =
          await _firebaseAuthInstance.signInAnonymously();
      fbUser = userCredential.user;

      if (fbUser != null) {
        pb.User pbUser = pb.User(id: fbUser.uid);
        final client = _usersApiSource.client;

        pbUser = await client.create(pbUser);
      }
    }

    return _mapFirebaseUserToUser(fbUser!);
  }

  Future<void> signOut() async {
    await _firebaseAuthInstance.signOut();
  }

  CurrentUser _mapFirebaseUserToUser(User firebaseUser) {
    return CurrentUser(
      id: firebaseUser.uid,
      name: firebaseUser.displayName ?? 'Anonymous',
      email: firebaseUser.email ?? '',
      phone: firebaseUser.phoneNumber ?? '',
      photoURL: firebaseUser.photoURL ?? '',
      photos: <UserPhoto>[],
      lastSeen: CurrentUser.offlineDateTime,
      gender: CurrentUser.othersGender,
      birthday: CurrentUser.defaultDateTime,
    );
  }
}
