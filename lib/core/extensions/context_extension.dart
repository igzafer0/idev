import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../init/notifier/theme_notifier.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
}

extension MarginExtension on BuildContext {
  EdgeInsets get marginHigh =>
      const EdgeInsets.symmetric(vertical: 20, horizontal: 20);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => watch<ThemeNotifier>().currentTheme;
  ColorScheme get colors => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}
