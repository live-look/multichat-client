import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChatWindow extends StatelessWidget {
  const ChatWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Онлайн 100500'),
          bottom: TabBar(
            tabs: [
              Tab(text: '***'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Text('Hello, world!'),
            )
          ],
        ),
      ),
    );
  }
}
