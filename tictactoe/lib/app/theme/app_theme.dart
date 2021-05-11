import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/numbers.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  scaffoldBackgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  buttonTheme: ButtonThemeData(buttonColor: Colors.red),
  bottomAppBarColor: Colors.black,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: AppColors.white,
  scaffoldBackgroundColor: AppColors.white,
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  buttonTheme: ButtonThemeData(buttonColor: Colors.blue.shade300),
  bottomAppBarColor: Colors.blueGrey.shade50,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey),
      borderRadius: BorderRadius.circular(Doubles.eight),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey),
      borderRadius: BorderRadius.circular(Doubles.eight),
    ),
    labelStyle: TextStyle(color: AppColors.grey),
  ),
);
