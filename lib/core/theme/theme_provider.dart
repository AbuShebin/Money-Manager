import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = NotifierProvider<ThemeProvider,ThemeMode>(
  () => ThemeProvider(),
);

class ThemeProvider extends Notifier<ThemeMode> {
  toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  ThemeMode build() {
    return ThemeMode.light;
  }
}
