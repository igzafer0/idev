import 'package:flutter/material.dart';
import 'package:idev/core/init/theme/app_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    _instance ??= AppThemeDark._init();
    return _instance!;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
        textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.red)),
      );
}
