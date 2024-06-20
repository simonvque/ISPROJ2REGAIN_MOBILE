import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ReGainTextTheme {
  ReGainTextTheme._();

  static TextTheme lightTextTheme({Color color = black}) {
    return TextTheme(
      //For emphasis, big solo text
      headlineLarge:
          TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: color),
      headlineMedium:
          TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: color),
      headlineSmall:
          TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: color),

      //For content title
      titleLarge:
          TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: color),
      titleMedium:
          TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: color),
      titleSmall:
          TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: color),

      //for body content, button texts
      bodyLarge:
          TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: color),
      bodyMedium: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.normal, color: color),
      bodySmall:
          TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: color),

      //for subtitle, small texts
      labelLarge:
          TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: color),
      labelMedium: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.normal, color: color),
    );
  }
}
