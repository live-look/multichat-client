import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/router/app_router_delegate.dart';
import 'presentation/bloc/auth_bloc.dart';

// import '../../router/app_router_delegate.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      lazy: false,
      create: (_) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Multichat',
        home: Theme(
          data: ThemeData(
            canvasColor: Colors.white,
            primarySwatch: Colors.deepPurple,
          ),
          child: Router(
            routerDelegate: AppRouterDelegate(),
          ),
        ),
      ),
    );
  }
}
