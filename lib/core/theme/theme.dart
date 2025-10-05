import 'package:flutter/material.dart';

class Palette {
  static const TextStyle customTextStyle = TextStyle(
      fontFamily: 'Urbanist', fontWeight: FontWeight.w500, color: blackColor);
  static const Color cardBackgroundColor = Color(0xFF8275EF);

  static const primaryColor = Color(0xFF231852);
  static const backgroundColor = Color(0xFFF6F6F6);
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const redColor = Colors.red;

  // static const appBarIconColor = Color.fromRGBO(231, 236, 239, 1.0);
  static const buttonTextColor = Color.fromRGBO(231, 236, 239, 1.0);
  static const hintTextColor = Color.fromRGBO(139, 140, 137, 1.0);
  static const snackBarErrorColor = Colors.red;
  static const snackBarSuccessColor = Colors.green;

  static const buttonColor = Color(0xFF2231D2);

  static var lightModeAppTheme = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      color: backgroundColor,
      titleTextStyle: TextStyle(
        color: blackColor,
        fontSize: 20,
      ),
    ),
    iconTheme: const IconThemeData(
      size: 30,
      color: blackColor,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(blackColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(primaryColor),
        foregroundColor: const WidgetStatePropertyAll(buttonTextColor),
        fixedSize: const WidgetStatePropertyAll(
          Size(100, 50),
        ),
      ),
    ),
  );
}
