import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/screens/data_screens/success_registration_screen.dart';
import 'package:hivefitx/utils/button.dart';
import 'package:hivefitx/utils/goal_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RegistrationPage2 extends StatefulWidget {
  const RegistrationPage2({Key? key}) : super(key: key);

  @override
  State<RegistrationPage2> createState() => _RegistrationPage2State();
}

class _RegistrationPage2State extends State<RegistrationPage2> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'What is your goal?',
              style: TextStyle(
                fontSize: 24,
                height: 1.5,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: size.width * 0.6,
              child: Text(
                'It will help us to choose a best program for you',
                style: TextStyle(
                fontSize: 14,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: Colors.white54,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // page view of goals
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  GoalCard(
                    title: 'Improve Shape',
                    description:
                    'I have a low amount of body fat and need / want to build more muscle',
                    imagePath: 'assets/images/getShape.png',
                  ),
                  GoalCard(
                    title: 'Lean & Tone',
                    description:
                    'I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way',
                    imagePath: 'assets/images/gainWeight.png',
                  ),
                  GoalCard(
                    title: 'Lose a Fat',
                    description:
                    'I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass',
                    imagePath: 'assets/images/lossWeight.png',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: ColorTransitionEffect(
                dotHeight: 6,
                dotWidth: 12,
                dotColor: Colors.white30,
                activeDotColor: Constants.primaryColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Button(btnText: 'Continue', onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuccessRegistration(),
                  ),
                );
              }),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}