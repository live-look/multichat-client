import 'package:equatable/equatable.dart';

abstract class InitEvent extends Equatable {
  const InitEvent();

  @override
  List<Object> get props => [];
}

class InitStarted extends InitEvent {
  const InitStarted() : super();
}
