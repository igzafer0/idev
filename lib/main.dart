import 'package:flutter/material.dart';
import 'package:idev/core/init/notifier/provider_list.dart';
import 'package:idev/core/init/notifier/theme_notifier.dart';
import 'package:idev/view/authenticate/view_test/view/view_test.dart';
import 'package:provider/provider.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';

Future<void> main() async {
  await _init();
  runApp(MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: const IdevRun()));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
}

class IdevRun extends StatelessWidget {
  const IdevRun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: context.watch<ThemeNotifier>().currentTheme,
    );
  }
}
