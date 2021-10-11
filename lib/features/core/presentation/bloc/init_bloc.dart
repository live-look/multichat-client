import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multichat/features/core/data/sources/users_local_source.dart';
import '../../entities/user.dart';

import 'init_event.dart';
import 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  //final DeviceInfo _deviceInfo;
  final FirebaseCrashlytics _crashlytics;

  InitBloc({
    // DeviceInfo? deviceInfo,
    FirebaseCrashlytics? crashlytics,
  })  : //_deviceInfo = deviceInfo ?? GetIt.I<DeviceInfo>(),
        _crashlytics = crashlytics ?? FirebaseCrashlytics.instance,
        super(const InitInProgress());

  @override
  Stream<InitState> mapEventToState(InitEvent event) async* {
    if (event is InitStarted) {
      await _initializeCrashlytics();
      await _initializeHive();
      // await _loadDeviceInfo();

      // TODO: Handle foreground messages (only for Android)
      // _firebaseMessagingSubscription =
      //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //   print('GOT SOME MESSAGE: ${message.notification}');
      // });

      yield const InitSuccess();
    } else {
      throw Exception("Unknown event $event");
    }
  }

  Future<void> _initializeCrashlytics() async {
    await _crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);

    Function? originalOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails errorDetails) async {
      await _crashlytics.recordFlutterError(errorDetails);
      // Forward to original handler.
      if (originalOnError != null) originalOnError(errorDetails);
    };
  }

  Future<void> _loadDeviceInfo() async {
    //await _deviceInfo.readDeviceInfo();
  }

  Future<void> _initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter<User>(UserAdapter());

    await Hive.openBox<User>(UsersLocalSource.boxName);
  }

  @override
  void onTransition(Transition<InitEvent, InitState> transition) {
    super.onTransition(transition);

    print(transition);
  }
}
