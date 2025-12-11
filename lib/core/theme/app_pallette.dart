import 'package:flutter/material.dart';

class AppPallette {
  // Light palette
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

  ///light theme
  static const Color lightPrimary = popWhite500;
  static const Color lightBackground = popWhite300;
  static const Color lightSurface = popBlack500;
  static const Color lightOnSurface = popWhite300;
  static const Color lightOnPrimary = popWhite300;
  static const Color lightTextPrimary = popBlack300;
  static const Color lightAccent = Color(0xFF8275EF);

  ///dark theme
  static const Color darkPrimary = popBlack500;
  static const Color darkBackground = popBlack400;
  static const Color darkSurface = popBlack300;
  static const Color darkTextPrimary = popWhite400;
    static const Color darkOnSurface = popWhite300;
  static const Color darkOnPrimary = popWhite300;
  static const Color darkAccent = Color(0xFF8275EF);

  // Feedback colors
  static const Color success = Color(0xFF144CC7); ///change it to green
  static const Color error = Color(0xFFEE4D37);
}