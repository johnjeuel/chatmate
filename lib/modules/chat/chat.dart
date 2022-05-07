import 'package:chatmate/modules/chat/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chatmate/widgets/app_appbar.dart';

import '../../widgets/chat_bubbles/received_message.dart';
import '../../widgets/chat_bubbles/send_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ChatProvider>(create: (_) => ChatProvider())
        ],
        child: Scaffold(
          appBar: CustomAppBar(title: 'Rrr'),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg_chat.jpg"),
                    fit: BoxFit.cover)),
            child: ListView(
              children: [
                SentMessage(message: "Hello"),
                ReceivedMessage(message: "Hi, how are you"),
                SentMessage(message: "I am great how are you doing"),
                ReceivedMessage(message: "I am also fine"),
                SentMessage(message: "Can we meet tomorrow?"),
                ReceivedMessage(message: "Yes, of course we will meet tomorrow"),
              ],
            ),
          ),
        ),
    );
  }
}
