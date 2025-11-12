import 'package:flutter/material.dart';

class Palette {
  static const TextStyle customTextStyle = TextStyle(
      fontFamily: 'Urbanist', fontWeight: FontWeight.w500, color: blackColor);
  static const Color cardBackgroundColor = Color(0xFF8275EF);

  static const primaryColor = Color(0xFF231852);
  static const backgroundColor = Color(0xFBFBFB);
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const redColor = Colors.red;

  // static const appBarIconColor = Color.fromRGBO(231, 236, 239, 1.0);
  static const buttonTextColor = Color.fromRGBO(231, 236, 239, 1.0);
  static const hintTextColor = Color.fromRGBO(139, 140, 137, 1.0);
  static const snackBarErrorColor = Colors.red;
  static const snackBarSuccessColor = Colors.green;

  static const buttonColor = Color(0xFF2231D2);

  ///cred theme
  // POP BLACK
  static const Color popBlack100 = Color(0xFF8A8A8A);
  static const Color popBlack200 = Color(0xFF3D3D3D);
  static const Color popBlack300 = Color(0xFF161616);
  static const Color popBlack400 = Color(0xFF121212);
  static const Color popBlack500 = Color(0xFF0D0D0D);

  // POP WHITE
  static const Color popWhite100 = Color(0xFFD2D2D2);
  static const Color popWhite200 = Color(0xFFE0E0E0);
  static const Color popWhite300 = Color(0xFFEFEFEF);
  static const Color popWhite400 = Color(0xFFFBFBFB);
  static const Color popWhite500 = Color(0xFFFFFFFF);

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
