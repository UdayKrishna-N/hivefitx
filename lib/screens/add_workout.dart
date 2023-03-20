import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/models/workoutModel.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({Key? key, required this.parameters})
      : super(key: key);

  final Parameters parameters;

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {

  @override
  void initState() {
    print(widget.parameters.equipment);
    super.initState();
  }

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
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: workout.warmUps.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text(workout.warmUps[index].exercise,),
            //       );
            //     },
            //   ),
            // ),
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
