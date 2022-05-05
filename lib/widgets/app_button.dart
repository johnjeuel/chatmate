

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  AppButton({required this.onPressed, required this.title, Key? key}) : super(key:key);

  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        width: 300,
        height: 40,
        child: ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 30)),
                overlayColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)),
            onPressed: onPressed,
            child: Text(
              title,
              style: const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w700, color: Colors.white),
            )),
      ),
    );
  }
}