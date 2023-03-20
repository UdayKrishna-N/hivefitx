import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/services/web_services.dart';
import 'package:hivefitx/view_models/workoutViewModel.dart';

class WorkoutScreen extends StatefulWidget {

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late WorkoutViewModel workout;

  @override
  void initState() {
    super.initState();
    // populateWorkoutPlan();
  }

  // populateWorkoutPlan() async {
  //   workout = await WebServices().fetchWorkoutPlan();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        title: Text('Workout Plan'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            // warm up
            Text(
              'Warm Up:',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: workout.warmUps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(workout.warmUps[index].exercise,),
                  );
                },
              ),
            ),
            // Exercises
            Text(
              'Exercises:',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: Center(),
            ),
            // Cool Down
            Text(
              'Cool Down:',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: Center(),
            ),
          ],
        ),
      ),
    );
  }
}
