import 'package:equatable/equatable.dart';

abstract class InitState extends Equatable {
  const InitState();

  @override
  List<Object> get props => [];
}

class InitInProgress extends InitState {
  const InitInProgress() : super();
}

class InitSuccess extends InitState {
  const InitSuccess() : super();
}
