import 'package:equatable/equatable.dart';
import '../../entities/user.dart';

abstract class UserProfileState extends Equatable {
  final User user;

  const UserProfileState({required this.user});

  @override
  List<Object> get props => [user];
}

class UserProfileInitial extends UserProfileState {
  UserProfileInitial() : super(user: User.empty());
}

class UserProfileChangeSuccess extends UserProfileState {
  const UserProfileChangeSuccess({required User user}) : super(user: user);
}

class UserProfileLoadInProgress extends UserProfileState {
  UserProfileLoadInProgress() : super(user: User.empty());
}

class UserProfileUpdateInProgress extends UserProfileState {
  UserProfileUpdateInProgress({required User user}) : super(user: user);
}

class UserProfileLoadSuccess extends UserProfileState {
  UserProfileLoadSuccess({required User user}) : super(user: user);
}

class UserProfileLoadFailed extends UserProfileState {
  UserProfileLoadFailed() : super(user: User.empty());
}

class UserProfileEditComplete extends UserProfileState {
  UserProfileEditComplete({required User user}) : super(user: user);
}
