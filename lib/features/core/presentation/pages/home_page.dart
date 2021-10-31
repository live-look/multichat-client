import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multichat/features/core/presentation/widgets/main_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multichat'),
        actions: AppMenu.mainMenu(context),
      ),
      body: Center(
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: <Widget>[
              ListTile(
                leading: const Icon(CupertinoIcons.search),
                title: const Text('Начать поиск'),
                trailing: const Icon(CupertinoIcons.chevron_right),
                onTap: () {
                  AutoRouter.of(context).navigateNamed("/chats");
                },
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.settings),
                title: const Text('Настройки поиска'),
                trailing: const Icon(CupertinoIcons.chevron_right),
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.chat_bubble),
                title: const Text('Сохраненные диалоги'),
                trailing: const Icon(CupertinoIcons.chevron_right),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
