import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hivefitx/screens/dashboard_screens/dashboard.dart';
import 'package:hivefitx/screens/login_screen.dart';


class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if(snapshot.hasData){
          return Dashboard();
        }else{
          return LoginScreen();
        }
      },
    );
  }
}
