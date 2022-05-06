import 'package:chatmate/common/constant.dart';
import 'package:chatmate/modules/message/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MessageProvider>(create: (_) => MessageProvider())
        ],
        child: Scaffold(
          backgroundColor: kColorGray,
          body: Center(
            child: Container(
              child: Text('No Messages Available'),
            ),
          ),
        ),
    );
  }
}
