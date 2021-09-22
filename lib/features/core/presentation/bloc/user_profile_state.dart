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
