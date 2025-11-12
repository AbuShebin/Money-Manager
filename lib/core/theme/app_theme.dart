import 'package:flutter/material.dart';

class Palette {
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

  // Primary theme colors
  static const Color primary = popBlack500;
  static const Color background = popWhite400;
  static const Color surface = popWhite500;
  static const Color textPrimary = popBlack300;
  static const Color accent = Color(0xFF8275EF); // CRED’s violet accent

  // Feedback colors
  static const Color success = Color(0xFF144CC7);
  static const Color error = Color(0xFFEE4D37);

  // Typography base
  static const TextStyle baseTextStyle = TextStyle(
    fontFamily: 'Urbanist',
    fontWeight: FontWeight.w500,
    color: textPrimary,
  );

  // Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: background,
    colorScheme: const ColorScheme.light(
      background: background,
      primary: primary,
      surface: surface,
      onPrimary: popWhite500,
      onSurface: popBlack300,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      elevation: 0,
      iconTheme: IconThemeData(color: popBlack300),
      titleTextStyle: TextStyle(
        color: popBlack300,
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    iconTheme: const IconThemeData(color: popBlack300, size: 28),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(primary),
        foregroundColor: const WidgetStatePropertyAll(popWhite500),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        fixedSize: const WidgetStatePropertyAll(Size(120, 48)),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: baseTextStyle,
      bodyMedium: baseTextStyle,
      labelLarge: baseTextStyle,
      titleMedium: baseTextStyle,
    ),
  );
}