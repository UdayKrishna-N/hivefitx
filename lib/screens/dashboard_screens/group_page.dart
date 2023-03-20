import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Group Page',
        style: TextStyle(
          fontSize: 30,
          color: Constants.primaryColor,
        ),
      ),
    );
  }
}
