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
  // StreamSubscription<User> _authenticationStatusSubscription;
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

        yield AuthSuccess(user: user);
        break;
      default:
        throw 'Unexected AuthEvent: $event';
    }
  }

  @override
  Future<void> close() {
    // _authenticationStatusSubscription.cancel();
    return super.close();
  }

  // _subscribeOnAuthStateChanges() {
  //   _authenticationStatusSubscription = FirebaseAuth.instance
  //       .authStateChanges()
  //       .distinct()
  //       .listen((User user) async {
  //     if (user != null) {
  //       final currentUser = await _authRepository.signIn(user);
  //       final photos = await _userPhotoRepository.getAll(currentUser.id);

  //       add(
  //         AuthEvent.login(
  //           photos.isNotEmpty
  //               ? currentUser.copyWith(photos: photos)
  //               : currentUser,
  //         ),
  //       );
  //     } else {
  //       add(AuthEvent.logout());
  //     }
  //   });
  // }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
