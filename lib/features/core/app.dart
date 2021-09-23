import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'app_router.gr.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter;

  _AppState()
      : _appRouter = AppRouter(),
        super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Multichat',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData(
        canvasColor: Colors.white,
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
