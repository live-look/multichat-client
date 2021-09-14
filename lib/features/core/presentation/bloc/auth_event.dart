import 'package:equatable/equatable.dart';
import '../../entities/current_user.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {
  const AuthStarted() : super();
}

class AuthFinished extends AuthEvent {
  final CurrentUser user;

  const AuthFinished({required this.user}) : super();

  @override
  List<Object> get props => [user];
}
