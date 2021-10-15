import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multichat'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Мой аккаунт'),
                onTap: () {
                  AutoRouter.of(context).navigateNamed("/profile");
                },
              ),
              PopupMenuItem(
                child: Text('Параметры поиска'),
                onTap: () {

                },
              ),
              PopupMenuItem(
                child: Text('Настройки'),
                onTap: () {

                },
              ),
              PopupMenuItem(
                child: Text('Пользовательское соглашение'),
                onTap: () {

                },
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: const Text('Home page'),
      ),
    );
  }
}
