import 'package:flutter/material.dart';

class Constants {
  static Color scaffoldBackgroundColor = Color(0xFF171717);
  static Color primaryColor = Color(0xFFFD7E14);

  static String mapsApiKey = 'AIzaSyB5c854BJFnqikwfZoXdcQagmXFiir15yo';

  InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color: Colors.grey.shade700,
      width: 2.0,
    ),
  );

  final List<String> locations = ['Gym', 'Home'];
  final List<String> muscles = [
    "abductors",
    "abs",
    "adductors",
    "back",
    "back_lower",
    "back_upper",
    "biceps",
    "calfs",
    "chest",
    "core",
    "core_lower",
    "core_upper",
    "forearms",
    "gluteus",
    "hamstring",
    "hands",
    "latissimus",
    "legs",
    "neck",
    "quadriceps",
    "shoulders",
    "shoulders_back",
    "shoulders_front",
    "triceps",
  ];
  final List<String> time = [
    '15',
    '30',
    '45',
    '60',
  ];
  final List<String> equipments = [
    'Band',
    'Dumbbell',
    'Barbell',
    'Body-weight',
    'Cable',
    'bosu-ball',
    'Elliptical-machine',
    'Hammer',
    'Kettlebell',
    'Wheel-roller',
    'Tire',
    'Stationary-bike',
    'Stepmill-machine',
    'rope',
    'sled-machine',
  ];
}
