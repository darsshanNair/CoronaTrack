import 'package:covid_tracker/app/AppColors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Circular',
    primaryColor: AppColors.primaryBlack,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Circular',
    primaryColor: AppColors.primaryBlack,
  );
}
