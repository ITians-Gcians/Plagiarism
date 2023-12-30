import 'dart:ui';

import 'package:flutter/material.dart';

class ThemeColor {
  static Color primary = Color(0xFFE96522);

  static Color white = Colors.white;
  static Color black = Colors.black;
}
// app_theme.dart (create a new file)

class AppTheme {
  static const Color purpleColor = Colors.purple;
  static const Color blueColor = Colors.blue;
  static const Color deepPurpleColor = Colors.deepPurple;
  static const Color lightBlueColor = Colors.lightBlue;
  static const Color whiteColor = Colors.white; // Add your custom color here
  static const Color blackColor = Colors.black;

  static ThemeData lightTheme = ThemeData(
    primaryColor: purpleColor,
    hintColor: blueColor,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: whiteColor), // Use your custom color here
    // Add more color customizations as needed
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: deepPurpleColor,
    hintColor: lightBlueColor,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: whiteColor), // Use your custom color here
    // Add more color customizations as needed for dark theme
  );
}
