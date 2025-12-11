import 'package:flutter/material.dart';
import 'package:money_management_app/core/theme/app_pallette.dart';
import 'package:money_management_app/core/theme/text_theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppPallette.lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallette.lightSurface,
      elevation: 0,
        iconTheme: IconThemeData(color: AppPallette.lightOnSurface),
      titleTextStyle: TextStyle(
        color: AppPallette.lightOnSurface,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    textTheme: TTextTheme.lightTextTheme,
    buttonTheme:const ButtonThemeData(buttonColor: AppPallette.darkSurface),
    colorScheme: const ColorScheme.light(
      primary: AppPallette.lightPrimary,
      surface: AppPallette.lightSurface,
      onPrimary: AppPallette.lightOnPrimary,
      onSurface: AppPallette.lightOnSurface,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppPallette.lightPrimary),
        foregroundColor: WidgetStatePropertyAll(AppPallette.popWhite500),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        fixedSize: WidgetStatePropertyAll(Size(120, 48)),
      ),
    ),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      backgroundColor: AppPallette.lightSurface,
      selectedIconTheme: IconThemeData(color: AppPallette.lightPrimary),
      unselectedIconTheme: IconThemeData(color: AppPallette.lightBackground)
    ),
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
      backgroundColor: AppPallette.lightSurface,
      foregroundColor: AppPallette.darkOnSurface
    ),
    listTileTheme:const ListTileThemeData(
    tileColor: AppPallette.lightSurface,
    iconColor: AppPallette.lightOnSurface,
    textColor: AppPallette.lightOnSurface,
    )
  );

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppPallette.darkPrimary,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppPallette.darkBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: AppPallette.darkOnSurface),
        titleTextStyle: TextStyle(
          color: AppPallette.darkTextPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),

      ),
      buttonTheme:const ButtonThemeData(buttonColor: AppPallette.lightSurface),
      iconTheme: const IconThemeData(color: AppPallette.popBlack300, size: 28),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppPallette.darkBackground),
          foregroundColor: WidgetStatePropertyAll(AppPallette.popWhite500),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          fixedSize: WidgetStatePropertyAll(Size(120, 48)),
        ),
      ),
      textTheme: TTextTheme.lightTextTheme,
      colorScheme: const ColorScheme.dark(
      primary: AppPallette.darkPrimary,
      surface: AppPallette.darkSurface,
      onPrimary: AppPallette.darkOnPrimary,
      onSurface: AppPallette.darkOnSurface,
    ),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      backgroundColor: AppPallette.lightSurface,
      selectedIconTheme: IconThemeData(color: AppPallette.lightPrimary),
      unselectedIconTheme: IconThemeData(color: AppPallette.lightBackground),
      selectedItemColor:  AppPallette.lightPrimary
    ),
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
      backgroundColor: AppPallette.darkSurface
    ),
    listTileTheme:const ListTileThemeData(
    tileColor: AppPallette.darkSurface,
    iconColor: AppPallette.darkOnSurface,
    textColor: AppPallette.darkOnSurface,
    )
);
}
