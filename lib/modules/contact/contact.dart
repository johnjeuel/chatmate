import 'package:chatmate/modules/contact/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chatmate/common/constant.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ContactProvider>(create: (_) => ContactProvider())
      ],
      child: Scaffold(
        backgroundColor: kColorGray,
        body: Center(
          child: Container(
            child: Text('No Contacts Available'),
          ),
        ),
      ),
    );
  }
}