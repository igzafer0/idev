// ignore_for_file: unused_field

import 'package:dio/dio.dart';
import 'package:idev/core/constants/enum/locale_keys_enum.dart';
import 'package:idev/core/init/cache/locale_manager.dart';
import 'package:idev/core/init/network/ICoreDio.dart';
import 'package:idev/core/init/network/core_dio.dart';

class NetworkManager {
  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      headers: {
        'val': LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
      },
    );

    coreDio = CoreDio(baseOptions);
  }
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDioNullSafety? coreDio;
}
