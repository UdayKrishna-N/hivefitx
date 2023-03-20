import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.btnText, required this.onTap}) : super(key: key);

  final String btnText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Constants.primaryColor,
        ),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
