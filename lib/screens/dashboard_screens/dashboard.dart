import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/screens/dashboard_screens/activity_page.dart';
import 'package:hivefitx/screens/dashboard_screens/group_page.dart';
import 'package:hivefitx/screens/dashboard_screens/home_page.dart';
import 'package:hivefitx/screens/dashboard_screens/profile_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    GroupPage(),
    ActivityPage(),
    ProfilePage(),
  ];

  final List<BottomNavigationBarItem> _navigationItems = [
    BottomNavigationBarItem(
      label: 'home',
      icon: Image.asset(
        'assets/icons/home-icon.png',
        height: 25,
        width: 25,
        color: Colors.white54,
        fit: BoxFit.fill,
      ),
      activeIcon: Image.asset(
        'assets/icons/home-icon.png',
        height: 25,
        width: 25,
        fit: BoxFit.fill,
        color: Constants.primaryColor,
      ),
    ),
    BottomNavigationBarItem(
      label: 'group',
      icon: Image.asset(
        'assets/icons/team-icon.png',
        height: 33,
        width: 33,
        color: Colors.white54,
        fit: BoxFit.fill,
      ),
      activeIcon: Image.asset(
        'assets/icons/team-icon.png',
        height: 33,
        width: 33,
        fit: BoxFit.fill,
        color: Constants.primaryColor,
      ),
    ),
    BottomNavigationBarItem(
      label: 'activity',
      icon: Image.asset(
        'assets/icons/activity-icon.png',
        height: 25,
        width: 25,
        color: Colors.white54,
        fit: BoxFit.fill,
      ),
      activeIcon: Image.asset(
        'assets/icons/activity-icon.png',
        height: 25,
        width: 25,
        fit: BoxFit.fill,
        color: Constants.primaryColor,
      ),
    ),
    BottomNavigationBarItem(
      label: 'profile',
      icon: Image.asset(
        'assets/icons/user-icon.png',
        height: 25,
        width: 25,
        color: Colors.white54,
        fit: BoxFit.fill,
      ),
      activeIcon: Image.asset(
        'assets/icons/user-icon.png',
        height: 25,
        width: 25,
        fit: BoxFit.fill,
        color: Constants.primaryColor,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationItems,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        backgroundColor: Constants.scaffoldBackgroundColor,
        elevation: 2,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
