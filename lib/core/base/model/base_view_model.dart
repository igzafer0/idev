import 'package:flutter/material.dart';
import 'package:idev/core/init/network/ICoreDio.dart';
import 'package:idev/core/init/network/network_manager.dart';

import '../../init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  late BuildContext viewModelContext;

  ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;

  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}
