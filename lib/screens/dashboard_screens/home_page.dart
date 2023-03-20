import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/packages/date.dart';
import 'package:hivefitx/screens/run_screen.dart';
import 'package:hivefitx/utils/workout_bottomsheet.dart';
import 'package:hivefitx/utils/workout_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        dateTime = dateTime.subtract(Duration(days: 1));
                      });
                    },
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Constants.primaryColor,
                      size: 25,
                    ),
                  ),
                  // column for day and date
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Date().getDay(dateTime),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 0.5,
                          color: Constants.primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        Date().getDate(dateTime),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 0.5,
                          color: Constants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  dateTime.isBefore(DateTime.now().subtract(Duration(days: 1)))
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              dateTime = dateTime.add(Duration(days: 1));
                            });
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Constants.primaryColor,
                            size: 25,
                          ),
                        )
                      : SizedBox(
                          width: 25,
                        ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // workout header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Workout',
                  style: TextStyle(
                    color: Colors.white30,
                    fontSize: 18,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                !dateTime.isBefore(DateTime.now().subtract(Duration(days: 1)))
                    ? GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              elevation: 0,
                              isScrollControlled: false,
                              context: context,
                              builder: (context) {
                                return WorkoutBottomSheet();
                              });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Constants.primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.add_rounded,
                            color: Colors.white70,
                            size: 25,
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 40,
                      ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            WorkoutCard(
              location: 'Gym',
              muscle: 'Shoulders',
              duration: 45,
              equipment: 'Dumbbells',
            ),
            SizedBox(
              height: 10,
            ),
            // Runs header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Runs',
                  style: TextStyle(
                    color: Colors.white30,
                    fontSize: 18,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                !dateTime.isBefore(DateTime.now().subtract(Duration(days: 1)))
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RunScreen(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Constants.primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.add_rounded,
                            color: Colors.white70,
                            size: 25,
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 40,
                      ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ));
  }
}
