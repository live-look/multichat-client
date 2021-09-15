import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/splash.dart';

class InitPage extends Page {
  const InitPage() : super(key: const ValueKey('InitPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => const Splash(),
    );
  }
}