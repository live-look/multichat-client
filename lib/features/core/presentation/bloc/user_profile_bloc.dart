import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../data/repositories/profile_repository.dart';
import 'user_profile_event.dart';
import 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final ProfileRepository _profileRepository;

  UserProfileBloc({ProfileRepository? profileRepository})
      : _profileRepository = profileRepository ?? GetIt.I<ProfileRepository>(),
        super(UserProfileInitial());

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
      case UserProfileLoadStarted:
        yield UserProfileLoadInProgress();
        final user = _profileRepository.getCurrentUserProfile();
        if (user != null) {
          yield UserProfileLoadSuccess(user: user);
        } else {
          yield UserProfileLoadFailed();
        }

        break;
      case UserProfileUpdateStarted:
        final user = (event as UserProfileUpdateStarted).user;
        yield UserProfileUpdateInProgress(user: user);
        await _profileRepository.updateCurrentUserProfile(user);
        yield UserProfileEditComplete(user: user);
        break;
      default:
        throw Exception('Unknown event');
    }
  }
}
