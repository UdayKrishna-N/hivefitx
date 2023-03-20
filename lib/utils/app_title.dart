import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Hive',
        style: TextStyle(
          fontSize: 36,
          height: 1.5,
          color: Constants.primaryColor,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
        ),
        children: [
          TextSpan(
            text: 'FitX',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}