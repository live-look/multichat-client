import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../pages/init_page.dart';
import '../pages/home_page.dart';
import '../pages/register_page.dart';

class AppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  List<Page> get _initStack => [
    const InitPage(),
  ];
  List<Page> get _registrationStack => [
    const RegisterPage(),
  ];
  List<Page> get _loggedInStack => [
    const HomePage(),
  ];
  AppRouterDelegate()
      : _navigatorKey = GlobalKey<NavigatorState>(),
        super();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (_, state) {
        List<Page> pages;
        switch (state.runtimeType) {
          case AuthSuccess:
            pages = _loggedInStack;
            break;
          case AuthFailure:
            pages = _registrationStack;
            break;
          default:
            pages = _initStack;
        }

        return Navigator(
          key: _navigatorKey,
          pages: pages,
          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;

            return true;
          },
        );
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}