import 'package:flutter/material.dart';
import 'package:money_management_app/core/theme/app_pallette.dart';
import 'package:money_management_app/core/theme/app_theme.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(fontWeight: FontWeight.bold,color: AppPallette.lightPrimary)
  );

   static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(fontWeight: FontWeight.bold,color: AppPallette.darkPrimary)
  );
}
