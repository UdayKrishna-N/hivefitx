import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';

class CountAnimation extends StatelessWidget {
   CountAnimation({Key? key, required this.count}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 1),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double size,_) {
        return Text(
          count.toString(),
          style: TextStyle(
            color: Constants.primaryColor,
            fontWeight: FontWeight.w900,
            fontSize: 250 * size,
          ),
        );
      },
    );
  }
}
