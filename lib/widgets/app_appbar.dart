import 'package:flutter/material.dart';
import 'package:chatmate/utils/common/app_strings.dart';
import 'package:chatmate/utils/common/constant.dart';

PreferredSizeWidget CustomAppBar({String title = 'Chatmate'}) {
    return  AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 10,),
          Text(title),
          const SizedBox(width: 10,),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.cyan,
    );
}
