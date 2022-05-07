import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'custom_shape.dart';

class ReceivedMessage extends StatelessWidget {
  final String message;
  const ReceivedMessage({Key? key, required this.message}) : super(key: key);

  Widget messageTextGroup() => Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: CustomPaint(
              painter: CustomShape(Colors.grey[300]),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ),
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50, left: 18, top: 15, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 30),
          messageTextGroup(),
        ],
      ),
    );;
  }
}
