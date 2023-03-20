import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/screens/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HiveFitX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
      ),
      home: SplashScreen(),
    );
  }

}