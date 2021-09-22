import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_profile_event.dart';
import 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileInitial());

  @override
  Stream<UserProfileState> mapEventToState(event) async* {
    switch (event.runtimeType) {
      case UserProfileAgeChanged:
        yield UserProfileChangeSuccess(
          user: state.user.copyWith(
            age: (event as UserProfileAgeChanged).age,
          ),
        );
        break;
      case UserProfileGenderChanged:
        yield UserProfileChangeSuccess(
          user: state.user.copyWith(
            gender: (event as UserProfileGenderChanged).gender,
          ),
        );
        break;
      case UserProfileNameChanged:
        yield UserProfileChangeSuccess(
          user: state.user.copyWith(
            name: (event as UserProfileNameChanged).name,
          ),
        );
        break;
      default:
        throw Exception('Unknown event');
    }
  }

  @override
  void onTransition(Transition<UserProfileEvent, UserProfileState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
