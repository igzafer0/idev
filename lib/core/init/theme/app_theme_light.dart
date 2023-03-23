import 'package:flutter/material.dart';
import 'package:idev/core/init/theme/app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
        textTheme: const TextTheme(
            titleLarge: TextStyle(color: Colors.red),
            bodyMedium: TextStyle(color: Colors.black54),
            bodyLarge: TextStyle(color: Colors.black)),
      );
}
