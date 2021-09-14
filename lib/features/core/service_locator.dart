import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'presentation/bloc/init_bloc.dart';
import 'data/repositories/auth_repository.dart';
import 'data/sources/users_api_source.dart';
import 'data/providers/jwt_provider.dart';

void setupServiceLocator() {
  GetIt.I.registerLazySingleton<InitBloc>(() => InitBloc());
  GetIt.I.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  GetIt.I.registerLazySingleton<UsersApiSource>(() => UsersApiSource());
  GetIt.I.registerLazySingleton<JwtProvider>(() => FirebaseAuthTokenProvider());
  GetIt.I.registerLazySingleton<AuthRepository>(() => AuthRepository());
}
