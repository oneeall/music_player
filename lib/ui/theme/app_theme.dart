import 'package:flutter/material.dart';

class AppTheme {
  AppTheme({
    required this.mode,
    required this.data,
  });

  factory AppTheme.light() {
    const mode = ThemeMode.light;
    final themeData = ThemeData.light().copyWith(
      primaryColor: Colors.blue,
    );
    return AppTheme(
      mode: mode,
      data: themeData,
    );
  }

  factory AppTheme.dark() {
    const mode = ThemeMode.dark;
    final themeData = ThemeData.dark();
    return AppTheme(
      mode: mode,
      data: themeData,
    );
  }

  final ThemeMode mode;
  final ThemeData data;
}
