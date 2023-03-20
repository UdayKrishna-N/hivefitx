import 'package:flutter/material.dart';
import 'package:hivefitx/screens/dashboard_screens/dashboard.dart';
import 'package:hivefitx/services/firebase_services.dart';
import 'package:hivefitx/utils/button.dart';

class SuccessRegistration extends StatelessWidget {
  const SuccessRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              height: size.height,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset(
                  'assets/images/success-registration.png',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder(
                    future: FirebaseServices().getName(),
                    builder: (context, snapshot) {
                      return Text(
                        'Welcome, Uday',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          height: 1.5,
                          color: Colors.white,
                        ),
                      );
                    }),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    'You are all set now, let’s reach your goals together with us',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Button(btnText: 'Go To Home', onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
                  }),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
