// ignore_for_file: unused_field

import 'package:dio/dio.dart';
import 'package:idev/core/constants/enum/locale_keys_enum.dart';
import 'package:idev/core/init/cache/locale_manager.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init() {
    final baseOptions = BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/",
        headers: {
          "key": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
        });
    _dio = Dio(baseOptions);
  }

  late Dio _dio;
}
