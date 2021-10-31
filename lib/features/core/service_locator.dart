import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'data/repositories/profile_repository.dart';
import 'data/sources/settings_local_source.dart';
import 'data/sources/users_local_source.dart';
import 'presentation/bloc/init_bloc.dart';
import 'data/repositories/auth_repository.dart';
import 'data/sources/users_remote_source.dart';
import 'data/providers/jwt_provider.dart';

void setupServiceLocator() {
  GetIt.I.registerLazySingleton<InitBloc>(() => InitBloc());
  GetIt.I.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  GetIt.I.registerLazySingleton<UsersRemoteSource>(() => UsersRemoteSource());
  GetIt.I.registerLazySingleton<JwtProvider>(() => FirebaseAuthTokenProvider());
  GetIt.I.registerLazySingleton<AuthRepository>(() => AuthRepository());

  GetIt.I.registerLazySingleton<UsersLocalSource>(() => UsersLocalSource());

  GetIt.I.registerLazySingleton<ProfileRepository>(() => ProfileRepository());
  GetIt.I.registerFactory<SettingsLocalSource>(
    () => SettingsLocalSource(),
  );
}
