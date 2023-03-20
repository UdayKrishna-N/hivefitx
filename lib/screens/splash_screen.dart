// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hivefitx/authentication.dart';
import 'package:hivefitx/utils/app_title.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    endSplashScreen();
  }

  endSplashScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Authentication(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // App Title
        child: AppTitle(),
      ),
    );
  }
}


