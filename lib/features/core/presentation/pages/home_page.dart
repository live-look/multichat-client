import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends Page {
  const HomePage() : super(key: const ValueKey('HomePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => Scaffold(
        body: Center(
          child: const Text('Home page'),
        ),
      ),
    );
  }
}