import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/models/workoutModel.dart';
import 'package:hivefitx/screens/add_workout.dart';
import 'package:hivefitx/utils/button.dart';

class WorkoutBottomSheet extends StatefulWidget {
  const WorkoutBottomSheet({Key? key}) : super(key: key);

  @override
  State<WorkoutBottomSheet> createState() => _WorkoutBottomSheetState();
}

class _WorkoutBottomSheetState extends State<WorkoutBottomSheet> {
  String? _locationValue;
  String? _muscleValue;
  String? _equipmentValue;
  String? _timeValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.scaffoldBackgroundColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Create Workout',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // location dropdown button
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                borderRadius: BorderRadius.circular(12),
                menuMaxHeight: 300,
                items: Constants()
                    .locations
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                hint: Text(
                  'Select Location : ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
                value: _locationValue,
                onChanged: (String? value) {
                  setState(() {
                    _locationValue = value!;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // muscle dropdown button
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                borderRadius: BorderRadius.circular(12),
                menuMaxHeight: 300,
                items: Constants()
                    .muscles
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                hint: Text(
                  'Select Muscle : ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
                value: _muscleValue,
                onChanged: (String? value) {
                  setState(() {
                    _muscleValue = value!;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // equipment dropdown button
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                borderRadius: BorderRadius.circular(12),
                menuMaxHeight: 300,
                items: Constants()
                    .equipments
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                hint: Text(
                  'Select Equipments : ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
                value: _equipmentValue,
                onChanged: (String? value) {
                  setState(() {
                    _equipmentValue = value!;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // time dropdown button
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                borderRadius: BorderRadius.circular(12),
                menuMaxHeight: 300,
                items: Constants()
                    .time
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                hint: Text(
                  'Select Time : ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
                value: _timeValue,
                onChanged: (String? value) {
                  setState(() {
                    _timeValue = value!;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Button(
            btnText: 'Create Workout',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddWorkoutScreen(
                    parameters: Parameters(
                      location: _locationValue,
                      muscle: _muscleValue,
                      equipment: _equipmentValue,
                      time: _timeValue,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
