import 'package:flutter/material.dart';
import 'package:chatmate/utils/common/app_strings.dart';
import 'package:chatmate/utils/common/constant.dart';

PreferredSizeWidget MyAppBar() {
    return  AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            child: Image.asset(
              kAssetsIcon,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 10,),
          const Text(kQuizWift),
          const SizedBox(width: 35,),
        ],
      ),
      centerTitle: true,
      backgroundColor: kColorBlue,
    );
}
