import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class AppMenu {
  static List<Widget> mainMenu(BuildContext context) => <Widget>[
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
              onTap: () {},
            ),
            PopupMenuItem(
              child: Text('Настройки'),
              onTap: () {
                AutoRouter.of(context).navigateNamed("/settings");
              },
            ),
            PopupMenuItem(
              child: Text('Пользовательское соглашение'),
              onTap: () {},
            ),
          ],
        ),
      ];
}
