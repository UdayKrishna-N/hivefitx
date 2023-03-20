import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';

class RunResults extends StatefulWidget {
  const RunResults({Key? key}) : super(key: key);

  @override
  State<RunResults> createState() => _RunResultsState();
}

class _RunResultsState extends State<RunResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Run Results'),
        centerTitle: true,
      ),
      backgroundColor: Constants.scaffoldBackgroundColor,
    );
  }
}
