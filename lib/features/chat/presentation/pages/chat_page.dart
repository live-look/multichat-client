import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/chat_window.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ChatWindow();
  }
}
