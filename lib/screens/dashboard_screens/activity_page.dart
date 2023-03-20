import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Activity Page',
        style: TextStyle(
          fontSize: 30,
          color: Constants.primaryColor,
        ),
      ),
    );
  }
}
