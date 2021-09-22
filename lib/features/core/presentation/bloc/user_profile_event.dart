import 'package:equatable/equatable.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class UserProfileAgeChanged extends UserProfileEvent {
  final int age;

  const UserProfileAgeChanged({required this.age}) : super();

  @override
  List<Object> get props => [age];
}

class UserProfileNameChanged extends UserProfileEvent {
  final String name;

  const UserProfileNameChanged({required this.name}) : super();

  @override
  List<Object> get props => [name];
}

class UserProfileGenderChanged extends UserProfileEvent {
  final String gender;

  const UserProfileGenderChanged({required this.gender}) : super();

  @override
  List<Object> get props => [gender];
}
