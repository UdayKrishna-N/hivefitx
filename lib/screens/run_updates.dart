import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/screens/dashboard_screens/dashboard.dart';
import 'package:hivefitx/screens/dashboard_screens/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RunUpdates extends StatefulWidget {
  const RunUpdates(DateTime dateTime, {Key? key}) : super(key: key);

  @override
  State<RunUpdates> createState() => _RunUpdatesState();
}

class _RunUpdatesState extends State<RunUpdates>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  PageController pageController = PageController(
    initialPage: 0,
  );
  int count = 3;
  int runTime = 0;
  bool changeUi = false;
  bool stopTimer = false;
  double distanceInMetres = 0;

  final List<Position> _positions = [];
  Stream<Position> positionStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  ),);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
    animationTimer();
    //Run Timer
    runTimer();
    //stream to get position(latlng)
    positionStream.listen((position) {
      if (_positions.isEmpty) {
        _positions.add(position);
      } else {
        var previousPosition = _positions.last;
        var distance = Geolocator.distanceBetween(
          previousPosition.latitude,
          previousPosition.longitude,
          position.latitude,
          position.longitude,
        );
        distanceInMetres = distanceInMetres + distance;
      }
      setState(() {});
    });
  }

  //Run Timer
  runTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        runTime++;
      });
      if (stopTimer) {
        timer.cancel();
      }
    });
  }

  // to stop animation and timer for count
  animationTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        count--;
      });
      if (count == -1) {
        timer.cancel();
        _controller.stop();
        setState(() {
          changeUi = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: changeUi
          ? PageView(
              controller: pageController,
              children: [
                // page 1
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      // Timer
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //min
                              Text(
                                (runTime / 60 < 10)
                                    ? '0${(runTime / 60).floorToDouble().toStringAsFixed(0)}'
                                    : (runTime / 60)
                                        .floorToDouble()
                                        .toStringAsFixed(0),
                                style: TextStyle(
                                  fontSize: 30,
                                  letterSpacing: 1,
                                  color: Constants.primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              // :
                              Text(
                                ':',
                                style: TextStyle(
                                  fontSize: 30,
                                  letterSpacing: 1,
                                  color: Constants.primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              //seconds
                              Text(
                                (runTime % 60 < 10)
                                    ? '0${runTime % 60}'
                                    : (runTime % 60).toString(),
                                style: TextStyle(
                                  fontSize: 30,
                                  letterSpacing: 1,
                                  color: Constants.primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Time',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      // kilometres count
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (distanceInMetres / 1000)
                                .toDouble()
                                .toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 120,
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Kilometres',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                      ),
                      // page Indicator
                      AnimatedSmoothIndicator(
                        activeIndex: 0,
                        count: 2,
                        effect: ColorTransitionEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 10,
                          dotColor: Colors.white38,
                          activeDotColor: Constants.primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //  pause button
                      GestureDetector(
                        onTap: () {
                          final snackBar = SnackBar(
                            content: Text('Long Press to stop the Run'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        onLongPress: () {
                          stopTimer = true;

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Constants.primaryColor,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.stop,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //page 2
                SafeArea(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 30),
                                child: Text(
                                  'Splits',
                                  style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Kilometre',
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'Time',
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        child: GestureDetector(
                          onTap: () {
                            pageController.previousPage(
                                duration: Duration(milliseconds: 250),
                                curve: Curves.linear);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 25,
                              horizontal: 30,
                            ),
                            decoration: BoxDecoration(
                              color: Constants.primaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  (runTime / 60 < 10)
                                      ? '0${(runTime / 60).floorToDouble().toStringAsFixed(0)}'
                                      : (runTime / 60)
                                          .floorToDouble()
                                          .toStringAsFixed(0),
                                  style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
// :
                                Text(
                                  ':',
                                  style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
//seconds
                                Text(
                                  (runTime % 60 < 10)
                                      ? '0${runTime % 60}'
                                      : (runTime % 60).toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : AnimatedBuilder(
              animation:
                  CurvedAnimation(parent: _controller, curve: Curves.linear),
              builder: (context, _) {
                return Center(
                  child: (count != 0)
                      ? Text(
                          count.toString(),
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 200 * _controller.value,
                          ),
                        )
                      : Text(
                          'Run',
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 125 * _controller.value,
                          ),
                        ),
                );
              },
            ),
    );
  }
}
