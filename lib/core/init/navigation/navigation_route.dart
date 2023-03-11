import 'package:flutter/material.dart';
import 'package:idev/core/components/card/not_found_navigation.dart';
import '../../../view/authenticate/test/view/view_test.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const ViewTest(), NavigationConstants.DEFAULT);

      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const ViewTest(), NavigationConstants.TEST_VIEW);

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigation(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }
}
