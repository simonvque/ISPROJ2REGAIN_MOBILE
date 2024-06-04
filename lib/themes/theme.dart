import 'package:flutter/material.dart';
import 'package:regain_mobile/themes/text_theme.dart';

import '../constants/colors.dart';

class AppTheme{
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    primaryColor: green,
    scaffoldBackgroundColor: white,
    textTheme: ReGainTextTheme.lightTextTheme,
  );
}