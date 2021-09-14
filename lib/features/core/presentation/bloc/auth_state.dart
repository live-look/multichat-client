import 'package:equatable/equatable.dart';
import '../../entities/current_user.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial() : super();
}

class AuthInProgress extends AuthState {
  const AuthInProgress() : super();
}

class AuthSuccess extends AuthState {
  final CurrentUser user;

  const AuthSuccess({required this.user}) : super();

  @override
  List<Object> get props => [user];
}

class AuthFailure extends AuthState {
  const AuthFailure() : super();
}

class AuthError extends AuthState {
  final String reason;

  const AuthError(this.reason) : super();

  @override
  List<Object> get props => [reason];
}

class AuthExitSuccess extends AuthState {
  const AuthExitSuccess() : super();
}
