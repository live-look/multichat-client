import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'init_bloc.dart';
import 'init_event.dart';
import 'init_state.dart';
import '../../data/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final InitBloc _initBloc;
  late final StreamSubscription<InitState> _initSubcription;

  AuthBloc({
    AuthRepository? authRepository,
    InitBloc? initBloc,
  })  : _authRepository = authRepository ?? GetIt.I<AuthRepository>(),
        _initBloc = initBloc ?? GetIt.I<InitBloc>(),
        super(const AuthInitial()) {
    _initSubcription = _initBloc.stream.listen((state) {
      if (state is InitSuccess) {
        _initSubcription.cancel();
        _initBloc.close();
        add(const AuthStarted());
      }
    });
    _initBloc.add(const InitStarted());
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    switch (event.runtimeType) {
      case AuthStarted:
        yield const AuthInProgress();

        final user = await _authRepository.signIn();
        if (user != null) {
          yield AuthSuccess(user: user);
          break;
        } else {
          yield const AuthFailure();
        }

        break;
      case AuthFormFilled:
        yield const AuthInProgress();
        final user =
            await _authRepository.signUp((event as AuthFormFilled).user);
        yield AuthSuccess(user: user);
        break;
      default:
        throw 'Unexpected AuthEvent: $event';
    }
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
