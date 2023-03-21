import 'package:flutter/material.dart';
import 'package:idev/core/init/theme/app_theme_dark.dart';
import 'package:idev/core/init/theme/app_theme_light.dart';

import '../../constants/enum/app_theme_enum.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeDark.instance.theme;

  AppThemes _currenThemeEnum = AppThemes.DARK;

  AppThemes get currenThemeEnum => _currenThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }

  void changeTheme() {
    if (_currenThemeEnum == AppThemes.LIGHT) {
      _currentTheme = AppThemeDark.instance.theme;
      _currenThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = AppThemeLight.instance.theme;
      _currenThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }
}
